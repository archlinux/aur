#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=fdk-aac-enc
pkgver=0.1.4
pkgrel=1
pkgdesc='AAC encoder frontend for FDK-AAC library'
arch=(x86_64 i686)
url='http://sourceforge.net/projects/opencore-amr/'
depends=(libfdk-aac=$pkgver)
license=(custom)
source=("http://downloads.sourceforge.net/opencore-amr/fdk-aac-$pkgver.tar.gz")

build()
{
    cd "$srcdir/fdk-aac-$pkgver"
    ./configure --enable-example
    make
}

package()
{
    cd "$srcdir/fdk-aac-$pkgver"
    install -D -m755 '.libs/aac-enc' "$pkgdir/usr/bin/aac-enc"
    install -d -m755 "$pkgdir/usr/share/licenses/" && cd "$pkgdir/usr/share/licenses/"
    ln -s libfdk-aac $pkgname
}
md5sums=('e274a7d7f6cd92c71ec5c78e4dc9f8b7')

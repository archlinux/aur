#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffhevc
pkgver=2.9.3
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.265/HEVC video format using ffmpeg and libx265.'
arch=(any)
url='https://sourceforge.net/projects/ffhevc/'
license=(GPL2)
depends=(ffmpeg)
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('114fe3b7fe0390f2a5e4c27ed7fe1ef4')

prepare()
{
    cd "$srcdir/$pkgname-$pkgver"
    sed -i -e "s,/usr/local,$pkgdir/usr,g" -e '/^MANDIR=/s,/man/,/share/man/,' install
}

package()
{
    cd "$srcdir/$pkgname-$pkgver"
    ./install
    rm "$pkgdir/usr/share/doc/$pkgname/uninstall"
}

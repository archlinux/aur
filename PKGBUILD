#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffx264
pkgver=3.0.0
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.264 video format using ffmpeg and libx264.'
arch=(any)
url='https://sourceforge.net/projects/ffx264/'
license=(GPL2)
depends=(ffmpeg)
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('7e730a26366c0e313b01a18663eb46ac')

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

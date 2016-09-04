#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffhevc
pkgver=2.7.8
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.265/HEVC video format using ffmpeg and libx265.'
arch=(any)
url='https://sourceforge.net/projects/ffhevc/'
license=(GPL2)
depends=(ffmpeg
         mplayer)
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")

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
md5sums=('41f152edafe7aac119c46bd322154398')

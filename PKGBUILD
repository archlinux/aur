# Maintainer: Heiko Baums <heiko@baums-on-web.de>
# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=videotrans
pkgver=1.6.1
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A set of scripts that allow reformatting movies into the VOB format that is used on DVDs"
url="http://videotrans.sourceforge.net/"
license=('GPL')
depends=('bc' 'ffmpeg' 'dvdauthor' 'mjpegtools' 'mplayer')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('2bb7f0c8194d3f248bb0f666b5e87210')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --mandir=$pkgdir/usr/share/man
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make prefix=$pkgdir/usr mandir=$pkgdir/usr/share/man install
}

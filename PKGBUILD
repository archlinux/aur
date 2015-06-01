# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>
# Contributor: Judd Vinet <jvinet@zeroflux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=ondir
pkgver=0.2.2
pkgrel=3
pkgdesc="Automatically execute commands as you traverse directories in the shell."
url="http://swapoff.org/ondir.html"
depends=('glibc')
arch=('x86_64' 'i686')
license=('GPL')
source=(http://swapoff.org/files/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('475fe7bd447756b4effde87c8aa67e063d805b775785b9f39858422dc244aef2')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  mkdir "$pkgdir/usr/share"
  mv "$pkgdir/usr/man" "$pkgdir/usr/share"
}

# Maintainer: Simon Wilper <sxw@chronowerks.de>
pkgname=tyrutils
pkgver=0.17
pkgrel=1
pkgdesc="Tyrann's Quake Utilities"
arch=('x86_64')
url='http://disenchant.net/utils/'
license=('GPL2')
depends=('glibc')
makedepends=('make')
source=('https://disenchant.net/files/utils/tyrutils-0.17.tar.gz')
sha512sums=('5054ea30b1d092d215cefea5649efcd3e2f472c8dce74deb10dbd7f21dbda5e7a52b765c3829332860e4eebedbf6d2e31a87f89b3d05a684ef58191c7ae5c640')

build() {
	cd "$pkgname-$pkgver"
  make
}

package() {
	cd "$pkgname-$pkgver"
  mkdir -p ${pkgdir}/usr/bin
  install -m755 bin/* ${pkgdir}/usr/bin/
  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}

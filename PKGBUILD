# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: kevku <kevku@msn.com>
# Contributor: Rene Pärts <rene87@hot.ee>
pkgname=libp11
pkgver=0.4.9
pkgrel=1
pkgdesc="A library implementing a small layer on top of the PKCS11 API"
arch=('i686' 'x86_64')
url="http://www.opensc-project.org/"
license=('LGPL')
depends=('openssl')
provides=('engine_pkcs11')
replaces=('engine_pkcs11')
source=("https://github.com/OpenSC/${pkgname}/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('9d1c76d74c21ca224f96204982097ebc6b956f645b2b0b5f9c502a20e9ffcfd8')


build() {
  cd "$pkgname-$pkgver"
  mkdir -p m4
  ./configure --prefix=/usr --disable-static
  make V=0
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

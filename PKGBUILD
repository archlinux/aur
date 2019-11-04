# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Josh VanderLinden <arch@cloudlery.com>

pkgname=s6
pkgver=2.9.0.1
pkgrel=1
pkgdesc='A small suite of programs for UNIX, designed to allow process supervision'
arch=('x86_64')
url="http://skarnet.org/software/${pkgname}"
license=('ISC')
depends=('skalibs' 'execline')
source=("${url}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e0cdbaf26e3ba1c41ecc0a8d1f45fb78194f96109b55cabeb849528b7e966c57')

build() {
  cd "${pkgname}-${pkgver}"

  ./configure --prefix=/usr --bindir=/usr/bin --sbindir=/usr/bin
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

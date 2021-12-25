# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Josh VanderLinden <arch@cloudlery.com>

pkgname=s6
pkgver=2.11.0.1
pkgrel=1
pkgdesc='A small suite of programs for UNIX, designed to allow process supervision'
arch=('x86_64')
url="http://skarnet.org/software/${pkgname}"
license=('ISC')
depends=('skalibs' 'execline')
source=("${url}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ad7f204587634eeb20ef8f7a7beb6dd63ba3080a46a3a650448ca7cc0826f90a')

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

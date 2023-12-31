# Maintainer:  Andrew O'Neill <andrew at haunted dot sh>
# Contributor: Josh VanderLinden <arch@cloudlery.com>

pkgname=s6
pkgver=2.12.0.3
pkgrel=1
pkgdesc='A small suite of programs for UNIX, designed to allow process supervision'
arch=('x86_64')
url="http://skarnet.org/software/${pkgname}"
license=('ISC')
depends=('skalibs' 'execline')
source=("${url}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('800d31226f6c25cdd3ec0b65240f80b56ce5ec137341d0a8d154e77638e58103')

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

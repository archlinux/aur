# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Josh VanderLinden <arch@cloudlery.com>

pkgname=execline
pkgver=2.9.1.0
pkgrel=1
pkgdesc='A (non-interactive) scripting language, like sh'
arch=('x86_64')
url="http://skarnet.org/software/${pkgname}"
license=('ISC')
depends=('skalibs')
source=("${url}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('b5d68e021fa0c4679089d265110a6c81f4ecc141067bf686dccb4bfd061c0404')

build() {
  cd "${pkgname}-${pkgver}"

  ./configure --prefix=/usr --libdir=/usr/lib
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Josh VanderLinden <arch@cloudlery.com>

pkgname=execline
pkgver=2.5.3.0
pkgrel=1
pkgdesc='A (non-interactive) scripting language, like sh'
arch=('i686' 'x86_64')
url="http://skarnet.org/software/${pkgname}"
license=('ISC')
depends=('skalibs')
source=("${url}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('05205c6869ae65a51c63d0e805572573806f6474aa21e12c49dd5654d3ceed33')

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

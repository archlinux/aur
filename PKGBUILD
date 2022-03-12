# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Josh VanderLinden <arch@cloudlery.com>

pkgname=execline
pkgver=2.8.3.0
pkgrel=1
pkgdesc='A (non-interactive) scripting language, like sh'
arch=('x86_64')
url="http://skarnet.org/software/${pkgname}"
license=('ISC')
depends=('skalibs')
source=("${url}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('235dbecd594c82e0523c87c2eacf04c48781b39264158f57049f1a1ff8b4ad80')

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

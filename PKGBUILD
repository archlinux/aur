# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Josh VanderLinden <arch@cloudlery.com>

pkgname=execline
pkgver=2.8.0.0
pkgrel=1
pkgdesc='A (non-interactive) scripting language, like sh'
arch=('i686' 'x86_64')
url="http://skarnet.org/software/${pkgname}"
license=('ISC')
depends=('skalibs')
source=("${url}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e7744b4a400eda68b83dcfb1bce65e454606279882d83d8230ddf8afda25766d')

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

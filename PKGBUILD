# Maintainer: Vlad Glagolev <scm(at)vaygr(dot)net>

pkgname=xqp
pkgver=0.1
pkgrel=2
pkgdesc="X Query pointer"
arch=('i686' 'x86_64')
url="https://github.com/baskerville/xqp"
license=('Unlicense')
depends=('libxcb')
provides=("${pkgname}")
conflicts=("${pkgname}-git")

source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('39d74c31e4525094fde006972c2011e9c0f353cb2591d0f64771ec6e10f0be23')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" PREFIX="/usr" install

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

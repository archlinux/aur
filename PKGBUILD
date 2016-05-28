# Maintainer: Eric Mrak <mail at ericmrak dot info>
pkgname="fry"
pkgver="0.1.6"
pkgrel=2
pkgdesc="A simple ruby version manager for fish"
url="https://github.com/terlar/fry"
arch=('any')
license=('MIT')
depends=('fish')
makedepends=()
provides=('fry')
conflicts=('fry-git')
source=(https://github.com/terlar/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('7cca4df6963efbbadbd1711183630404375f7e7b9fc98313632810b61ab1e93f')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "${pkgdir}/usr/share/fish/vendor_conf.d" \
           "${pkgdir}/usr/share/fish/vendor_completions.d" \
           "${pkgdir}/usr/share/fish/vendor_functions.d"
  make PREFIX="${pkgdir}/usr" install >/dev/null
  install -D -m644 ${srcdir}/${pkgname}-${pkgver}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}

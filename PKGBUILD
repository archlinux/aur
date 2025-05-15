# Maintainer: dashy-jngl <you@example.com>
pkgname=stardom-card
pkgver=0.1.0
pkgrel=3
pkgdesc="CLI tool to scrape and display Stardom event cards"
arch=('x86_64')
url="https://github.com/dashy-jngl/stardom-card"
license=('MIT')
depends=(python-requests python-beautifulsoup4 python-wcwidth python-deep-translator)
makedepends=('python-pip')
source=(https://github.com/dashy-jngl/stardom-card/archive/v${pkgver}.tar.gz)
sha512sums=('SKIP')  # replace with real sum if you like

build() {
  cd "$srcdir/stardom-card-${pkgver}"
  python -m pip install \
    --root="$pkgdir" \
    --prefix=/usr \
    --no-deps \
    --no-build-isolation \
    .
}

package() {
  # pip already installed everything into $pkgdir/usr
  :
}

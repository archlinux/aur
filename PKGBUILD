# Maintainer: Ingmar Steen <iksteen@gmail.com>

pkgname=hyprmonmon
pkgver=0.1.0
pkgrel=1
pkgdesc="Manage, remember and monitor different display layouts in hyprland"
arch=('any')
url="https://github.com/iksteen/hyprmonmon"
license=('MIT')
depends=('python-hyprpy' 'python-click' 'hyprland' 'nwg-displays')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry')

source=("https://github.com/iksteen/${pkgname}/archive/refs/tags/v${pkgver}.zip")
sha256sums=('58fac3ac10415b6ca410953bdb149ffbd90a42842ffa5722fb9c7f03d89cff67')

build() {
  cd "$srcdir/$pkgname-${pkgver}"
  poetry build -f wheel
}

package() {
  cd "$srcdir/$pkgname-${pkgver}"
  python -m installer --destdir="$pkgdir" "dist/${pkgname}-${pkgver}-py3-none-any.whl"
}

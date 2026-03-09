# Maintainer: aisuneko icecat <iceneko@protonmail.ch>

pkgname="linkermapviz"
pkgver=r8.8ee5a6d
pkgrel=1
pkgdesc="GNU ld linker map visualization"
arch=('x86_64')
url="https://github.com/PromyLOPh/linkermapviz"
license=('MIT')
depends=('python-bokeh' 'python-squarify')
makedepends=('python-build' 'python-installer' 'python-wheel')
provides=("linkermapviz")
source=("git+https://github.com/PromyLOPh/linkermapviz")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

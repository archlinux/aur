# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="fava-portfolio-summary-git"
pkgver=r20.8730fb4
pkgrel=1
pkgdesc="Fava extension to display a portfolio summary"
url="https://github.com/PhracturedBlue/fava-portfolio-summary"
license=("GPL3")
arch=("any")
depends=(    "fava")
makedepends=("git"
             "python-build"
             "python-installer"
             "python-setuptools-scm"
             "python-wheel")
options=("!strip")
source=("git+$url")
sha256sums=("SKIP")

pkgver() {
 cd "fava-portfolio-summary"
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build(){
 cd "fava-portfolio-summary"
 python -m build --wheel --no-isolation
}

package(){
 cd "fava-portfolio-summary"
 python -m installer --destdir="$pkgdir" dist/*.whl
}

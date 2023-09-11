# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="fava-review-git"
pkgver=r47.38edad4
pkgrel=1
pkgdesc="Custom review for Beancount in Fava"
url="https://github.com/kubauk/fava-review"
license=("GPL3")
arch=("any")
depends=(    "fava"
             "python-beautifulsoup4"
             "python-petl")
makedepends=("git"
             "python-build"
             "python-installer"
             "python-setuptools-scm"
             "python-wheel")
options=("!strip")
source=("git+$url")
sha256sums=("SKIP")

pkgver() {
 cd "fava-review"
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build(){
 cd "fava-review"
 python -m build --wheel --no-isolation
}

package(){
 cd "fava-review"
 python -m installer --destdir="$pkgdir" dist/*.whl
}

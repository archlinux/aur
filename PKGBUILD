# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="beangrow-git"
pkgver=r15.7dd642b
pkgrel=2
pkgdesc="Returns calculations on portfolios in Beancount"
url="https://github.com/beancount/beangrow"
license=("GPL2")
arch=("any")
provides=("beangrow")
depends=("beancount")
makedepends=("git"
             "python-build"
             "python-installer"
             "python-setuptools-scm"
             "python-wheel")
options=("!strip")
source=("git+$url")
b2sums=('SKIP')

pkgver() {
 cd "beangrow"
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build(){
 cd "beangrow"
 python -m build --wheel --no-isolation
}

package(){
 cd "beangrow"
 python -m installer --destdir="$pkgdir" dist/*.whl
}

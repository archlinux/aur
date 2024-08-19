# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="fava-dashboards-git"
pkgver=r93.50a0b7c
pkgrel=1
pkgdesc="Custom Dashboards for Beancount in Fava"
url="https://github.com/andreasgerstmayr/fava-dashboards"
license=("GPL3")
arch=("any")
depends=(    "fava"
             "beanquery"
             "python-pyaml")
makedepends=("git"
             "python-build"
             "python-installer"
             "python-hatchling"
             "python-hatch-vcs"
             "python-setuptools-scm"
             "python-wheel")
options=("!strip")
#source=("git+$url#branch=update-project-layout")
source=("git+$url")
sha256sums=("SKIP")

pkgver() {
 cd "fava-dashboards"
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build(){
 cd "fava-dashboards"
 python -m build --wheel --no-isolation
}

package(){
 cd "fava-dashboards"
 python -m installer --destdir="$pkgdir" dist/*.whl
}

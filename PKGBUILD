# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="fava-investor-git"
pkgver=0.4.0.r0.g0e3f652
pkgrel=1
pkgdesc="Comprehensive set of reports, analyses, and tools for investments, for Beancount and Fava"
url="https://github.com/redstreet/fava_investor"
license=("GPL3")
arch=("any")
depends=(    "fava"
             "python-click-aliases"
             "python-importlib-metadata"
             "python-tabulate"
             "python-yfinance")
makedepends=("git"
             "python-build"
             "python-installer"
             "python-setuptools-scm"
             "python-wheel")
options=("!strip")
source=("git+$url")
sha256sums=("SKIP")

pkgver() {
 cd "fava_investor"
 git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
 cd "fava_investor"
 python -m build --wheel --no-isolation
}

package(){
 cd "fava_investor"
 python -m installer --destdir="$pkgdir" dist/*.whl
}

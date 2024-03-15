pkgname=python-androguard
pkgver=4.1.1
pkgrel=1
pkgdesc="Python framework for Android application analysis."
arch=("any")
url="https://github.com/androguard/androguard/"
license=("Apache")
depends=("python" "python-setuptools" "ipython" "python-future" "python-networkx" "python-pygments" "python-lxml" "python-colorama" "python-matplotlib" "python-asn1crypto" "python-click" "python-pydot")
makedepends=("python-build" "python-installer" "python-wheel" "python-poetry")
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/androguard/androguard/archive/v${pkgver}.tar.gz")
md5sums=('18abca99ea35fcf5bfc6d1d1a2c8f315')

build() {
    cd androguard-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd androguard-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}

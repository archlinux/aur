pkgname=python-androguard
pkgver=4.1.3
pkgrel=2
pkgdesc="Python framework for Android application analysis."
arch=("any")
url="https://github.com/androguard/androguard/"
license=("Apache")
depends=("python" "python-setuptools" "ipython" "python-networkx" "python-pygments" "python-lxml" "python-colorama" "python-matplotlib" "python-asn1crypto" "python-click" "python-pydot" 'python-loguru' 'python-apkinspector')
makedepends=("python-build" "python-installer" "python-wheel" "python-poetry")
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/androguard/androguard/archive/v${pkgver}.tar.gz")
md5sums=('900af7a8c4acda9205e3dceac0f3bedf')

build() {
    cd androguard-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd androguard-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}

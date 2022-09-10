pkgbase=python-pyrtcm
pkgname=python-pyrtcm
_module='pyrtcm'
pkgver=0.3.0
pkgrel=1
pkgdesc="RTCM3 Protocol Parser"
url="https://github.com/semuconsulting/pyrtcm"
depends=('python')
makedepends=(python-build python-installer python-wheel python-setuptools)
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('2f2e1de15e3e279402a1a5cdf69f34407f6758ec45cffced29e504e982f2f7c3')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

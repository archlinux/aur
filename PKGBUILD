# Maintainer: <https://aur.archlinux.org/account/zeauw>

_name=ligotimegps
pkgname=python-${_name}-git
pkgver=2.0.1.r19.g7359fc7
pkgrel=1
pkgdesc="Pure-python implementation of lal.LIGOTimeGPS"
arch=('any')
url='https://github.com/gwpy/ligotimegps'
license=('GPLv3')
depends=('python')
makedepends=('python-wheel' 'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm')
provides=("python-ligotimegps")
conflicts=("python-ligotimegps")
source=("ligotimegps::git+https://github.com/gwpy/ligotimegps")
sha256sums=('SKIP')

build() {
    export SETUPTOOLS_SCM_PRETEND_VERSION=2.0.1
    cd ligotimegps
    python -m build --wheel --no-isolation
}

package() {
    cd ligotimegps
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

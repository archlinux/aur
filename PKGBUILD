# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

_pkgbase='wgtools'
pkgname="python-${_pkgbase}"
pkgver=1.0.6
pkgrel=2
pkgdesc='Python bindings for wireguard-tools'
arch=('any')
url="https://github.com/conqp/${_pkgbase}"
license=('GPLv3')
depends=('python' 'python-setuptools' 'wireguard-tools')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
source=("${_pkgbase}::git+${url}.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${_pkgbase}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgbase}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

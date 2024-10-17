# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

_pkgbase='dzdsu'
pkgname="python-${_pkgbase}"
pkgver=1.7.16
pkgrel=1
pkgdesc='DayZ dedicated server utility.'
arch=('any')
url="https://github.com/conqp/${_pkgbase}"
license=('MIT')
depends=('python' 'python-psutil' 'python-setuptools' 'steamcmd')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
source=("${_pkgbase}::git+${url}.git#tag=${pkgver}")
md5sums=('04ce96853e6b6244c065874c425d49d8')

build() {
    cd "${srcdir}/${_pkgbase}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgbase}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

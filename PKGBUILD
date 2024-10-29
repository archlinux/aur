# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

_pkgbase='dzdsu'
pkgname="python-${_pkgbase}"
pkgver=1.7.18
pkgrel=1
pkgdesc='DayZ dedicated server utility.'
arch=('any')
url="https://github.com/conqp/${_pkgbase}"
license=('MIT')
depends=('python' 'python-psutil' 'python-setuptools' 'steamcmd')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
source=("${_pkgbase}::git+${url}.git#tag=${pkgver}")
md5sums=('6d6011d42df052b92d89d022cf1dca44')

build() {
    cd "${srcdir}/${_pkgbase}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgbase}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

# Maintainer: Oystein Sture <oysstu at protonmail.com>

pkgname=('python-vcs2l')
pkgver='1.1.6'
pkgrel=2
pkgdesc='A version control system tool designed to make working with multiple repositories easier (python-vsctool fork)'
arch=('any')
url='https://github.com/ros-infrastructure/vcs2l'
license=('Apache')
depends=('python' 'python-yaml')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=('python-vcstool')
conflicts=('python-vcstool')

source=("https://github.com/ros-infrastructure/vcs2l/archive/${pkgver}.tar.gz")
sha256sums=('d7e545b0a69e860eaed36eec9bb824935e01fa03693d6bb50e3ddeb95408f615')

_pkgbase=${pkgname#python-}

build() {
    cd "${srcdir}/$_pkgbase-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/$_pkgbase-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

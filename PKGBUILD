# Maintainer: Oystein Sture <oysstu at protonmail.com>

pkgname=('python-vcs2l')
pkgver='1.1.7'
pkgrel=1
pkgdesc='A version control system tool designed to make working with multiple repositories easier (python-vsctool fork)'
arch=('any')
url='https://github.com/ros-infrastructure/vcs2l'
license=('Apache')
depends=('python' 'python-yaml')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=('python-vcstool')
conflicts=('python-vcstool')

source=("https://github.com/ros-infrastructure/vcs2l/archive/${pkgver}.tar.gz")
sha256sums=('7c61d250bc0c8188bb7d2a7f63e2d7ed66274eb8424eeb1c40cf7796e2485839')

_pkgbase=${pkgname#python-}

build() {
    cd "${srcdir}/$_pkgbase-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/$_pkgbase-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

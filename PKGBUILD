# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>

pkgname=python-repomatic
_name=${pkgname#python-}
pkgver=6.17.0
pkgrel=1
pkgdesc='Automate repository maintenance, releases, and CI/CD workflows'
url='https://github.com/kdeldycke/extra-platforms'
makedepends=(python-build python-installer python-uv-build)
depends=(python python-click python-yaml python-extra-platforms python-tomli python-boltons python-packaging python-click-extra python-typing_extensions python-wcmatch)
license=('GPL-2.0-or-later')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kdeldycke/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('a142b1b287e13eccd8d80bbd2dbab0bec8a9d47339f3109cddfc6f85bca341e5ae4d3d624ed1ebe757db403187bde46302b018d425305771635426d1ff9e14bc')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}
package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

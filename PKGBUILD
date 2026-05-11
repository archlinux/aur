# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>

pkgname=python-repomatic
_name=${pkgname#python-}
pkgver=6.18.3
pkgrel=1
pkgdesc='Automate repository maintenance, releases, and CI/CD workflows'
url='https://github.com/kdeldycke/extra-platforms'
makedepends=(python-build python-installer python-uv-build)
depends=(python python-click python-yaml python-extra-platforms python-tomli python-boltons python-packaging python-click-extra python-typing_extensions python-wcmatch)
license=('GPL-2.0-or-later')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kdeldycke/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('3ec22b3728e97975520d69e986c5082a5125828a26a9c6b3f271f0350c95364a676c9cd7cc212ac0a2e3dbd8528c43b9e34f8521604a547bac70eef02e19cef7')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}
package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

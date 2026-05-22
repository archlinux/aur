# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>

pkgname=python-repomatic
_name=${pkgname#python-}
pkgver=6.19.0
pkgrel=1
pkgdesc='Automate repository maintenance, releases, and CI/CD workflows'
url='https://github.com/kdeldycke/extra-platforms'
makedepends=(python-build python-installer python-uv-build)
depends=(python python-click python-yaml python-extra-platforms python-tomli python-boltons python-packaging python-click-extra python-typing_extensions python-wcmatch)
license=('GPL-2.0-or-later')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kdeldycke/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('3e67fba2ece1e3e9b71ff647511ff4e769ce0d9113cc624d435a39903e8c59db0728ae473532ac935a54d21d7ce7a677d8c83cb4f03c65af48780f67c2181e97')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}
package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

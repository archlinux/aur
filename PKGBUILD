# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>

pkgname=python-repomatic
_name=${pkgname#python-}
pkgver=6.13.0
pkgrel=1
pkgdesc='Automate repository maintenance, releases, and CI/CD workflows'
url='https://github.com/kdeldycke/extra-platforms'
makedepends=(python-build python-installer python-uv-build)
depends=(python python-click python-yaml python-extra-platforms python-tomli python-boltons python-packaging python-click-extra python-typing_extensions python-wcmatch)
license=('GPL-2.0-or-later')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kdeldycke/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('66a38637230d486d9ad926de0874bdf5a817fb93b971f834443a39a05fb37145a3a44943e6c735b1cc89383ff42c2e6d130d1d079a459a704266c1cba979d91e')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}
package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: rosetintedcheeks <oaks at rosetintedcheeks dot com>
# Contributor: Clément Démoulins <clement@archivel.fr>
# Contributor: Zhaofeng Li <hello@zhaofeng.li>
# Contributor: Carlo Cabanilla <carlo.cabanilla@gmail.com>

## GPG key: https://github.com/jsirois.gpg

pkgname=python-pex
pkgver=2.94.0
pkgrel=1
arch=('any')
pkgdesc='Generates executable Python environments'
url='https://docs.pex-tool.org/'
license=('Apache-2.0')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-uv' 'python-uv-build' 'python-setuptools')
# checkdepends=('python-tox')
changelog=CHANGES.md
provides=('pex')
replaces=('pex')
source=("$pkgname::git+https://github.com/pex-tool/pex#tag=v$pkgver?signed")
validpgpkeys=('A1FE765B15233EAD18FA6ABB93E55CB567B5C626')
sha256sums=('c4e282c939d85692e04ede6f21f4730158182de8f4620fbd50b1645236d62c28')

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

# check() {
#   cd "$pkgname"
#   tox -e check
# }

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir/" dist/*.whl
}

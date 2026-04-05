# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: rosetintedcheeks <oaks at rosetintedcheeks dot com>
# Contributor: Clément Démoulins <clement@archivel.fr>
# Contributor: Zhaofeng Li <hello@zhaofeng.li>
# Contributor: Carlo Cabanilla <carlo.cabanilla@gmail.com>

## GPG key: https://github.com/jsirois.gpg

pkgname=python-pex
pkgver=2.92.0
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
sha256sums=('76339ad5178ddc94f35aa5e72f1728b9ec9db6391080e0e1b65dcac913eea5d2')

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

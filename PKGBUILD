# Maintainer: Mark Wells <contact at markwells dot dev>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=keeper-secrets-manager-helper
pkgver=1.1.1
pkgrel=1
pkgdesc="Keeper Secrets Manager SDK helper module"
arch=('any')
url="https://github.com/Keeper-Security/secrets-manager"
license=('MIT')
depends=(
    'python'
    'keeper-secrets-manager-core>=17.1.0'
    'python-yaml'
    'python-iso8601'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
)
source=("https://files.pythonhosted.org/packages/source/k/keeper_secrets_manager_helper/keeper_secrets_manager_helper-$pkgver.tar.gz")
sha512sums=('cbe24b43ae3ef625b3bcdda832c48582139202730ed7a59d82576424d9ab85ce3e8fcaf6a221ea1c65e5ab15849d095f799993bc4172150d7b81ef6cca275f7d')

build() {
    cd "keeper_secrets_manager_helper-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "keeper_secrets_manager_helper-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
# vim:set ts=2 sw=2 et:

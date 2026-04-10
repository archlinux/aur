# Maintainer: Mark Wells <contact at markwells dot dev>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=keeper-secrets-manager-helper
pkgver=1.1.0
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
sha512sums=('e207c43e7cb75c4c55d37aac264b051e8720bb5c8099a14f7cd723f2f0b3c1536048c57e2472217fa33ef8bcd6f2d5f6531303c99d609cdf1fea34a846db880f')

build() {
    cd "keeper_secrets_manager_helper-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "keeper_secrets_manager_helper-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
# vim:set ts=2 sw=2 et:

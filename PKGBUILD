# Maintainer: Mark Wells <contact@markwells.dev>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=keeper-secrets-manager-helper
pkgver=1.0.7
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
sha512sums=('657156b9b213a55e0d4a6f4abd8b8dae001d1dabc367b166e50b7549089ee11492a24513af8c8215fdf52a741efe7ee796724e716051adfbedf83a61d23cb921')

build() {
    cd "keeper_secrets_manager_helper-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "keeper_secrets_manager_helper-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
# vim:set ts=2 sw=2 et:

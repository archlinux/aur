# Maintainer: Mark Wells <contact at markwells dot dev>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=keeper-secrets-manager-cli
pkgver=1.2.0
pkgrel=1
pkgdesc="Command line tool for Keeper Secrets Manager"
arch=('any')
url="https://github.com/Keeper-Security/secrets-manager"
license=('MIT')
depends=('python'
    'keeper-secrets-manager-core>=17.0.0'
    'keeper-secrets-manager-helper>=1.0.6'
    'keeper-secrets-manager-storage>=1.0.2'
    'python-prompt_toolkit'
    'python-jsonpath-rw-ext'
    'python-colorama'
    'python-click'
    'python-click-help-colors'
    'python-click-repl'
    'python-yaml'
    'python-update-checker'
    'python-psutil'
    'python-boto3'
)
makedepends=(
    'python-installer'
    'python-build'
    'python-setuptools'
)
source=("https://files.pythonhosted.org/packages/source/k/keeper_secrets_manager_cli/keeper_secrets_manager_cli-$pkgver.tar.gz")
sha512sums=('3406e37302fa3065c747da3e741714f2fe80afe84e0d10687aa69ded7661d86b798dea1180fdf50024575a73842c5211b1d7f977f0a3c2a1257b541cce461fe7')

build() {
    cd "keeper_secrets_manager_cli-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "keeper_secrets_manager_cli-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:

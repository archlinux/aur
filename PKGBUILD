# Maintainer: Mark Wells <contact at markwells dot dev>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=keeper-secrets-manager-cli
pkgver=1.3.0
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
sha512sums=('9f718072e6e047f635e2ea9bb217ae54eb69abccdae075a0aa53da3f788a1e4fb26438eb69e52ed7cd17a4701f8b0df7b6dc41b1d5a2726fa9ea09c61bd38e8b')

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

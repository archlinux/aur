# Maintainer: Mark Wells <contact at markwells dot dev>
# Contributor: David Runge <dvzrv at archlinux dot org>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-click-repl
pkgver=0.3.0
pkgrel=1
pkgdesc="Subcommand REPL for click apps"
arch=('any')
url="https://github.com/click-contrib/click-repl"
license=('MIT')
depends=(
    'python'
    'python-click>=7.0'
    'python-prompt_toolkit>=3.0.36'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
)
source=("https://files.pythonhosted.org/packages/source/c/click-repl/click-repl-$pkgver.tar.gz")
sha512sums=('ce6763c8b194c7e8c2100dc140c3af9696e3528e5d74befa98129cde2cff98df7e3c26de65ae42dff8c001b85264e4a7094f1de9421129cd986415e4f3a5a1fa')

build() {
    cd "click-repl-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "click-repl-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:

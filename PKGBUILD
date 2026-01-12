# Maintainer: Noufal <noufalkakdlr@gmail.com>
pkgname=git-wizard
pkgver=0.2.0
pkgrel=1
pkgdesc="A simple CLI tool to automate Git setup, GitHub repo creation, and SSH configuration"
arch=('any')
url="https://github.com/noufalkdlr/git-wizard"
license=('GPL3')
depends=('python' 'python-typer' 'python-rich' 'python-inquirer' 'git')
optdepends=('github-cli: Automatically detect GitHub username and protocol for connect command')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/noufalkdlr/git-wizard/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('35f29796502ffd4e1f0bc48c651fee3e7785f2d091ea3ce67be7246cef6e2bd1')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# Maintainer: Noufal <noufalkakdlr@gmail.com>
pkgname=git-wizard
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple CLI tool to automate Git setup, GitHub repo creation, and SSH configuration"
arch=('any')
url="https://github.com/noufalkdlr/git-wizard"
license=('GPL3')
depends=('python' 'python-typer' 'python-rich' 'git')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/noufalkdlr/git-wizard/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('72303c05d7c85e6b256a81eae8aab25bafb9403274a6fbe3cd561cc5ddd58432')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

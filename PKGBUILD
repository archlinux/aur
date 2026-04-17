# Maintainer: Samuel Hearn <scchearn@gmail.com>
pkgname=task-tui
_name=task-tui
pkgver=1.4.0
pkgrel=1
pkgdesc="A modern, interactive TUI for Taskwarrior built with Textual"
arch=('any')
url="https://github.com/lbesnard/task-tui"
license=('MIT')
depends=('python' 'python-textual')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')

source=("$pkgname-$pkgver.tar.gz::https://github.com/lbesnard/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('94548c50497a9d01b3a2fa22c48ade730ce227b0c07d75501d6bbfebcfed7e1e')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

# check() {
#     cd "$_name-$pkgver"
#     PYTHONPATH="$PWD" pytest -o addopts=""
# }

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

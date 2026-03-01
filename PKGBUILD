# Contributor: Reed Law <reed@lawlap.top>
# Python package author: Karl Voit <tools@Karl-Voit.at>

pkgname=python-date2name
_commit="8288f190e6af224a4c4e7b8de8e60a334b016660"
pkgver=2026.3.1.1
pkgrel=1
pkgdesc="Handling time-stamps and date-stamps in file names"
arch=(any)
url="https://github.com/novoid/date2name"
license=('GPL-3.0-only')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname::git+${url}.git#commit=$_commit")
sha256sums=('4955a786df444e025f741a82dd74dab191dbf26a8ffc9dabfbbccd0b7942f088')

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

check() {
    cd "$pkgname"
    pytest -v test_date2name.py
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir/" dist/*.whl
}

# vim: set ts=4 sw=4 et:

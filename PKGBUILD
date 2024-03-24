# Contributor: Reed Law <reed@lawlap.top>
# Python package author: Karl Voit <tools@Karl-Voit.at>

pkgname=python-date2name
_name=${pkgname#python-}
pkgver=2024.3.10.1
pkgrel=1
pkgdesc="Handling time-stamps and date-stamps in file names"
arch=(any)
url="https://github.com/novoid/date2name"
license=('GPL-3.0-only')
depends=('python')
makedepends=('python-poetry')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('9f2d6aef91c6b1d56e1404018e2bde9375d0f38d033a279baebd1f1a1174136e')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir/" dist/*.whl
}

# vim: set ts=4 sw=4 et:

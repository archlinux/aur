# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-inventree-part-import
_name=${pkgname#python-}
pkgver=1.9.0
pkgrel=1
pkgdesc="CLI to import parts from into your InvenTree instance"
url="https://github.com/30350n/inventree_part_import"
depends=(
    'python-beautifulsoup4'
    'python-browser-cookie3'
    'python-click'
    'python-cutie'
    'python-digikey-api'
    'python-error-helper'
    'python-fake-useragent'
    'python-inventree'
    'python-isocodes'
    'python-mouser'
    'python-platformdirs'
    'python-requests'
    'python-requests-oauthlib'
    'python-tablib'
    'python-thefuzz'
    'python-yaml'
)
makedepends=(python-build python-installer python-wheel python-poetry)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('bfda0d3c4e7a247049a2e08dbce6a0b5426da0342bc15b5484080cff7dc8f287')

build() {
    cd "$srcdir/${_name//-/_}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${_name//-/_}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

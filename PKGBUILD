# $Id$
# Maintainer: Tobias Rueetschi <tr@brief.li>
# Contributor: Tobias Rueetschi <tr@brief.li>

pkgname='python-leo'
pkgver=1.0
pkgrel=1
pkgdesc='python library for leo dict'
arch=('any')
url='https://github.com/keachi/python-leo'
license=('Apache')
group=()
depends=(
    'python'
    'python-beautifulsoup4'
    'python-requests'
    'python-lxml'
)
optdepends=()
makedepends=(
    'python'
    'git'
    'python-setuptools'
)
checkdepends=()
source=("https://github.com/keachi/python-leo/archive/v${pkgver}.tar.gz")
sha256sums=('1b6e716f1c66ef4a9f083f1e7190d48d41a4edc4f985babb2babfeffea32eb18')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --prefix="/usr" --root="${pkgdir}" --optimize=1
}

# Maintainer: Quentin Bouvet <qbouvet at outlook dot com>
pkgname=python-wpm
_name=wpm
pkgver=1.51.5
pkgrel=1
pkgdesc="Typeracer-like console app for measuring your WPM"
arch=('any')
url="https://github.com/cslarsen/wpm"
license=('aGPLV3')
makedepends=('python-setuptools')
depends=()

source=("${pkgname}-${pkgver}::https://github.com/cslarsen/wpm/archive/v${pkgver}.tar.gz")
sha256sums=('74b86418f526c2b4d1e2028ac3207a303f08cb505804c893061ade78b821e4fb')

build() {
    cd "$srcdir"/"$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir"/"$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

#
# makepkg --printsrcinfo > .SRCINFO
#

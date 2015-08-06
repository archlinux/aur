# Maintainer: Tom Richards <tom@tomrichards.net>
# https://github.com/t-richards/aur-python-editorconfig
_pkgname=editorconfig-core-py
pkgname=python-editorconfig
pkgver=0.12.0
pkgrel=1
pkgdesc="Clone of EditorConfig core written in Python"
arch=('any')
url="http://editorconfig.org/"
license=('PSF')
depends=('python')
makedepends=('python' 'python-setuptools')
source=("https://github.com/editorconfig/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('0b8e2468305b5795c2f887f936ffc461143567792eed5c81985cbc35b13a7bc0')

prepare() {
    cd "$_pkgname-$pkgver"
    python setup.py clean
}

build() {
    cd "$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

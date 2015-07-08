# Maintainer: Eli Schwartz <eschwartz93@gmail.com>

_pkgname=KindleUnpack
pkgname=kindleunpack
pkgver=0.80
pkgrel=1
pkgdesc="Extract text, images and metadata from Kindle/Mobi files"
arch=('any')
url="http://www.mobileread.com/forums/showthread.php?t=61986"
license=('GPLv3')
depends=('python')
source=("https://github.com/kevinhendricks/${_pkgname}/archive/v${pkgver}.tar.gz"
        "Installing-with-setuptools.diff")
sha256sums=('567d22d7f48c050a896e64c3ac1a77c83ad0beda8767bae9e2f9f10607839b51'
            '4eb7f6b6021efffe7b7baf5497e8cba21f9bfab9bf2e0c9cc6df06e1e8247204')
prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    patch -p1 <../Installing-with-setuptools.diff
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}

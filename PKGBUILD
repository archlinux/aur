# Contributor: wiltsig <WTS012201@gmail.com>

pkgname=tfi
_pkgname=Text-From-Image
pkgver=1.0.3
pkgrel=3
pkgdesc="Text From Image allows user to extract and modify text from images"
arch=('x86_64')
url="https://github.com/WTS012201/Text-From-Image.git"
license=('GPL-3.0-or-later')
depends=('fmt' 'hdf5' 'jsoncpp' 'opencv' 'qt6-base' 'tesseract-data-eng' 'vtk')
makedepends=('git')
source=("git+$url#commit=da8c5fd648fcaa6dd6082d8da14ab91345609e33")
sha256sums=('5ac442b904d4b4eaafde5dc1a0bfbc8d2eabe8e00258fc83a4c7843e3eaec072')

build() {
    cd "${_pkgname}"
    qmake6
    make
}
package() {
    cd "${_pkgname}"
    install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}

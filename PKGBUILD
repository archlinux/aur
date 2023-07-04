pkgname="nasa-skyviewer-git"
_pkgname="skyviewer"
pkgver=1.0
pkgrel=1
pkgdesc="An OpenGL-based program to display HEALPix-based skymaps stored in FITS format files"
arch=("x86_64")
url='https://github.com/nasa-lambda/skyviewer'
license=('custom')
makedepends=('git' 'qconf' 'cfitsio' 'libqglviewer' 'healpix')
source=("$pkgname::git+https://github.com/nasa-lambda/skyviewer.git")
sha256sums=('SKIP')


build() {
    cd "$srcdir/${pkgname}"
    qmake
    make
}

package() {
    install -Dm755 "${srcdir}/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

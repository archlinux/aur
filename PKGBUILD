# Maintainer:  Alois Nespor <alium at artixlinux.org>

pkgname=pdfarranger-git
pkgver=r654.20370a4
pkgrel=1
pkgdesc="Helps merge or split pdf documents and rotate, crop and rearrange pages."
arch=('any')
url="https://github.com/jeromerobert/pdfarranger"
license=('GPL3')
depends=(gtk3 python-gobject python-cairo python-pikepdf python-dateutil ghostscript python-setuptools poppler-glib)
makedepends=(git python-distutils-extra)
conflicts=('pdfshuffler' 'pdfshuffler-git' 'pdfarranger')
source=($pkgname::"git+https://github.com/jeromerobert/pdfarranger")
md5sums=('SKIP')

pkgver () {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
    cd "$srcdir/$pkgname"
    python setup.py build
}

package () {
    cd "$srcdir/$pkgname"
    python setup.py install --prefix=/usr --root="$pkgdir"
}

# Maintainer: Edoardo Brogiolo <edoardo@brogiolo.eu>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Paulo Matias <matiasΘarchlinux-br·org>

pkgname=pdf2djvu
pkgver=0.9.18.1
pkgrel=10
pkgdesc="Creates DjVu files from PDF files"
arch=('x86_64')
url="https://jwilk.net/software/pdf2djvu"
license=('GPL')
depends=('poppler' 'djvulibre' 'gcc-libs' 'graphicsmagick' 'exiv2')
makedepends=('python2-nose' 'ttf-liberation' 'boost')
source=(https://github.com/jwilk/pdf2djvu/releases/download/${pkgver}/pdf2djvu-${pkgver}.tar.xz)
sha256sums=('ab45d7c70ba837f01e6b5b5c18acf8af6200dad4bae8e47e4c2ca01fbf2fa930')

build() {
    cd ${pkgname}-${pkgver}

    ./configure --prefix=/usr
    make
}

check() {
    cd ${pkgname}-${pkgver}

   make PYTHON=python2 test
}

package() {
    cd ${pkgname}-${pkgver}

    make install DESTDIR="${pkgdir}"
}

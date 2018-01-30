# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-pdf-mupdf
pkgver=0.3.2
pkgrel=2

pkgdesc="PDF support for Zathura (MuPDF backend) (Supports PDF, ePub, and OpenXPS)"
url="https://pwmt.org/projects/zathura-pdf-mupdf/"
arch=('x86_64')
license=('zlib')

conflicts=('zathura-pdf-poppler')

depends=('zathura' 'jbig2dec' 'openjpeg2' 'cairo' 'desktop-file-utils' 'openssl')
makedepends=('libmupdf')

source=(https://pwmt.org/projects/zathura/plugins/download/zathura-pdf-mupdf-$pkgver.tar.gz)

sha1sums=('b33c7ec1ac3cf2ee575b7cc1eae611f00b9ba8d7')

build() {
  make -C zathura-pdf-mupdf-$pkgver MUPDF_LIB="-lmupdf -lmupdfthird"
}

package(){
  make -C zathura-pdf-mupdf-$pkgver DESTDIR="$pkgdir" install
  install -Dm0644 zathura-pdf-mupdf-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-pdf-mupdf
pkgver=0.3.1
pkgrel=3

pkgdesc="PDF support for Zathura (MuPDF backend)"
url="https://pwmt.org/projects/zathura-pdf-mupdf/"
arch=('i686' 'x86_64')
license=('zlib')

conflicts=('zathura-pdf-poppler')

depends=('zathura' 'jbig2dec' 'openjpeg2' 'cairo' 'desktop-file-utils' 'openssl')
makedepends=('libmupdf')

source=(https://pwmt.org/projects/zathura/plugins/download/zathura-pdf-mupdf-$pkgver.tar.gz)

sha1sums=('ef37a181de96d6fca36db3ac818f790dcf3627ae')

build() {
  make -C zathura-pdf-mupdf-$pkgver MUPDF_LIB="-lmupdf -lmupdfthird"
}

package(){
  make -C zathura-pdf-mupdf-$pkgver DESTDIR="$pkgdir" install
  install -Dm0644 zathura-pdf-mupdf-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

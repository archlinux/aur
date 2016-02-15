# $Id: PKGBUILD 67819 2012-03-14 16:22:14Z spupykin $
# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-pdf-mupdf
pkgver=0.3.0
pkgrel=1

pkgdesc="PDF support for Zathura (MuPDF backend)"
url="https://pwmt.org/projects/zathura-pdf-mupdf/"
arch=('i686' 'x86_64')
license=('custom')

conflicts=('zathura-pdf-poppler')

depends=('zathura' 'jbig2dec' 'openjpeg2' 'cairo')
makedepends=('mupdf>=1.4')

source=(https://pwmt.org/projects/zathura/plugins/download/zathura-pdf-mupdf-$pkgver.tar.gz)
sha1sums=('ae0be41ea7c75b8ddc083fe01f1366673ea9751a')

build() {
  make -C zathura-pdf-mupdf-$pkgver MUPDF_LIB="-lmupdf -lmujs"
}

package(){
  make -C zathura-pdf-mupdf-$pkgver DESTDIR="$pkgdir" install
  install -Dm0644 zathura-pdf-mupdf-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

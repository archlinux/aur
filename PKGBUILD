# $Id: PKGBUILD 67819 2012-03-14 16:22:14Z spupykin $
# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-pdf-mupdf
pkgver=0.2.8
pkgrel=1
pkgdesc="PDF support for Zathura (MuPDF backend)"
arch=('i686' 'x86_64')
url="https://pwmt.org/projects/zathura-pdf-mupdf/"
license=('custom')
depends=('zathura' 'jbig2dec' 'openjpeg2' 'cairo')
conflicts=('zathura-pdf-poppler')
makedepends=('mupdf>=1.4')
source=("https://pwmt.org/projects/zathura/plugins/download/$pkgname-$pkgver.tar.gz")
md5sums=('b0bf109c536bf1da131c38861cebb7e6')

build() {
  make -C "${srcdir}/$pkgname-$pkgver" MUPDF_LIB="-lmupdf -lmujs"
}

package(){
  make -C "${srcdir}/$pkgname-$pkgver" DESTDIR="$pkgdir" install
  install -Dm0644 "${srcdir}/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

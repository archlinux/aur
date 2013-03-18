# $Id: PKGBUILD 67819 2012-03-14 16:22:14Z spupykin $
# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-pdf-mupdf
pkgver=0.2.3
pkgrel=1
pkgdesc="Adds pdf support to zathura by using the mupdf library"
arch=('i686' 'x86_64')
url="https://pwmt.org/projects/zathura/plugins/zathura-pdf-mupdf/"
license=('custom')
depends=('mupdf>=1.1' 'zathura')
conflicts=('zathura-pdf-poppler')
source=("https://pwmt.org/projects/zathura/plugins/download/$pkgname-$pkgver.tar.gz")
md5sums=('777ba69a321ef4bb9cbced8f6733927a')

build() {
  make -C "${srcdir}/$pkgname-$pkgver"
}

package(){
  make -C "${srcdir}/$pkgname-$pkgver" DESTDIR="$pkgdir" install
  install -Dm0644 "${srcdir}/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

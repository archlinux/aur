# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Jiachen Yang <farseerfc@gmail.com>
# Contributor: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: Ferik <djferik at gmail dot com>

pkgname=masterpdfeditor-qt4
pkgver=4.0.60
pkgrel=1
pkgdesc='A complete solution for creation and editing PDF files - Qt4 version'
url='http://code-industry.net/free-pdf-editor.php'
arch=('i686' 'x86_64')
license=('custom')
conflicts=('masterpdfeditor')
source=('masterpdfeditor.desktop')
source_i686=("http://get.code-industry.net/public/master-pdf-editor-${pkgver}_i386.tar.gz")
source_x86_64=("http://get.code-industry.net/public/master-pdf-editor-${pkgver}_qt4.amd64.tar.gz")
sha1sums=('5b3a0392390e49d4f7f4e478dd336476436f5cfa')
sha1sums_i686=('e0235a6c8fd5c0a560fa8392ee012c4993a7dff1')
sha1sums_x86_64=('55d4586199c1b6cc57ba5de5ad9ae878b9c73146')

package() {
  depends=('gcc-libs' 'glibc' 'qt4' 'sane')

  install -d "$pkgdir"{/opt/,/usr/bin/,/usr/share/applications/}
  cp -a --no-preserve=ownership master-pdf-editor-${pkgver%%.*} "$pkgdir/opt/"
  sed "s/VERMAJ/${pkgver%%.*}/g" masterpdfeditor.desktop > "$pkgdir/usr/share/applications/masterpdfeditor${pkgver%%.*}.desktop"
  ln -s /opt/master-pdf-editor-${pkgver%%.*}/masterpdfeditor${pkgver%%.*} -t "$pkgdir/usr/bin/"
  install -Dm644 master-pdf-editor-${pkgver%%.*}/license.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}

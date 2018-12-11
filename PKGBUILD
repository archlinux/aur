# Maintainer: Davide Peressoni <davide dot peressoni at outlook dot com>
# Contributor: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Jiachen Yang <farseerfc@gmail.com>
# Contributor: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: Ferik <djferik at gmail dot com>

pkgname=masterpdfeditor-free
pkgver=4.3.89
pkgrel=1
pkgdesc='A complete solution for creation and editing PDF files - Free version without watermark'
url='https://code-industry.net/free-pdf-editor/'
arch=('i686' 'x86_64')
license=('custom')
conflicts=('masterpdfeditor-qt4')
source=('masterpdfeditor.desktop')
source_i686=("http://code-industry.net/public/master-pdf-editor-${pkgver}_i386.tar.gz")
source_x86_64=("http://code-industry.net/public/master-pdf-editor-${pkgver}_qt5.amd64.tar.gz")
sha1sums=('5b3a0392390e49d4f7f4e478dd336476436f5cfa')
sha1sums_i686=('3f7b1a8d293814b2e6e6cf6d9d6b79522ff0a2f9')
sha1sums_x86_64=('254e05e0845ff73b7c932280c2bbe8d22aa4934c')

package() {
  depends=('gcc-libs' 'glibc' 'qt5-base' 'sane')

  install -d "$pkgdir"{/opt/,/usr/bin/,/usr/share/applications/}
  cp -a --no-preserve=ownership master-pdf-editor-${pkgver%%.*} "$pkgdir/opt/"
  sed "s/VERMAJ/${pkgver%%.*}/g" masterpdfeditor.desktop > "$pkgdir/usr/share/applications/masterpdfeditor${pkgver%%.*}.desktop"
  ln -s /opt/master-pdf-editor-${pkgver%%.*}/masterpdfeditor${pkgver%%.*} -t "$pkgdir/usr/bin/"
  install -Dm644 master-pdf-editor-${pkgver%%.*}/license.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}

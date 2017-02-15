# Maintainer: Bjoern Franke <bjo@nord-west.org>

pkgname=xnconvert
pkgver=1.73
pkgrel=1
pkgdesc="A cross-platform batch image-converter and resizer with a powerful and ease of use experience."
url="http://www.xnview.com/en/xnconvert/"
arch=('x86_64' 'i686')
license=('custom')
depends=('glib2' 'expat' 'libpng12')
source=('xnconvert.desktop')
source_i686=("http://download.xnview.com/XnConvert-linux.tgz")
source_x86_64=("http://download.xnview.com/XnConvert-linux-x64.tgz")
sha256sums=('b163bca7039f6877239535b88b9aacb6fde78573dc141a52addb99cb85b35f82')
sha256sums_x86_64=('fbaf9e284de0973b0338f88ecda525eb5ec4b02f7b6d1305f4dc472aad2778ad')
sha256sums_i686=('4a75dadb22020ed58a7e08e9d522fc3aa8e9f52bd7a4e0bc384774d685d8b01e')

package() {
  install -d "$pkgdir"/{opt/xnconvert,usr/bin}
  cp -R XnConvert/* "$pkgdir"/opt/xnconvert
  ln -s /opt/xnconvert/xnconvert.sh "$pkgdir"/usr/bin/xnconvert
  install -Dm644 xnconvert.desktop "$pkgdir"/usr/share/applications/xnconvert.desktop
  install -Dm644 XnConvert/license.txt "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}

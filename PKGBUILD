# Maintainer: Bjoern Franke <bjo@nord-west.org>

pkgname=xnconvert
pkgver=1.74
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
sha256sums_x86_64=('329832996766b9b1b259b7a8161a431c3c1edc9753590b6c4b6f93ea5868f752')
sha256sums_i686=('7757d4e865e3dbab8f795dd37fefdf83293b5e305ab42fc64320668dfc8836fe')

package() {
  install -d "$pkgdir"/{opt/xnconvert,usr/bin}
  cp -R XnConvert/* "$pkgdir"/opt/xnconvert
  ln -s /opt/xnconvert/xnconvert.sh "$pkgdir"/usr/bin/xnconvert
  install -Dm644 xnconvert.desktop "$pkgdir"/usr/share/applications/xnconvert.desktop
  install -Dm644 XnConvert/license.txt "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}

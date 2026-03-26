# Maintainer: Inaha rin@notalium.co

pkgname=pjsk-cursor-theme
pkgver=0.0.4
pkgrel=1
pkgdesc="Project Sekai mouse cursors as X icon themes"
url="https://colorfulstage.com/media/download/"
license=('custom')
arch=('any')
makedepends=('bash' 'wget' 'unzip' 'win2xcur')
source=('pjsk_cursor.sh')
sha256sums=('86c56375778240485ea6c3877257c3de6cb132fcdb66cc29ec19b079b4c21d41')

prepare() {
  chmod +x "$srcdir"/pjsk_cursor.sh
  cd "$srcdir"
  ./pjsk_cursor.sh
}

package() {
  install -dm755 "$pkgdir"/usr/share/icons
  cp -r "$srcdir"/packaged/* "$pkgdir"/usr/share/icons/
}

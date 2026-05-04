# Maintainer: Inaha rin@notalium.co

pkgname=pjsk-cursor-theme
pkgver=0.0.5
pkgrel=1
pkgdesc="Project Sekai mouse cursors as X icon themes"
url="https://colorfulstage.com/media/download/"
license=('custom')
arch=('any')
makedepends=('bash' 'wget' 'unzip' 'win2xcur')
source=('pjsk_cursor.sh')
sha256sums=('9256984b2b06811f2880871f54267fa82a187e19da3d8f3324d67531955a2d99')

prepare() {
  chmod +x "$srcdir"/pjsk_cursor.sh
  cd "$srcdir"
  ./pjsk_cursor.sh
}

package() {
  install -dm755 "$pkgdir"/usr/share/icons
  cp -r "$srcdir"/packaged/* "$pkgdir"/usr/share/icons/
}

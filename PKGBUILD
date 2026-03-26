# Maintainer: Inaha rin@notalium.co

pkgname=pjsk-cursor-theme
pkgver=0.0.3
pkgrel=1
pkgdesc="Project Sekai mouse cursors as X icon themes"
url="https://colorfulstage.com/media/download/"
license=('custom')
arch=('any')
makedepends=('bash' 'wget' 'unzip' 'win2xcur')
source=('pjsk_cursor.sh')
sha256sums=('929dc91ee0d1159054640126fb7b35ebfb9ee8b113f1421b089c170092eadfa2')

prepare() {
  chmod +x "$srcdir"/pjsk_cursor.sh
  cd "$srcdir"
  ./pjsk_cursor.sh
}

package() {
  install -dm755 "$pkgdir"/usr/share/icons
  cp -r "$srcdir"/packaged/* "$pkgdir"/usr/share/icons/
}

# Maintainer: Inaha rin@notalium.co

pkgname=pjsk-cursor-theme
pkgver=0.0.1
pkgrel=1
pkgdesc="Project Sekai mouse cursors as X icon themes"
url="https://colorfulstage.com/media/download/"
license=('custom')
arch=('any')
makedepends=('bash' 'wget' 'unzip' 'win2xcur')
source=('pjsk_cursor.sh')
sha256sums=('e2e5b289a7a4475985049e2fbdc62a22eb565bf1cee85b36964c0bd7c8f30c6d')

prepare() {
  chmod +x "$srcdir"/pjsk_cursor.sh
  cd "$srcdir"
  ./pjsk_cursor.sh
}

package() {
  install -dm755 "$pkgdir"/usr/share/icons
  cp -r "$srcdir"/packaged/* "$pkgdir"/usr/share/icons/
}

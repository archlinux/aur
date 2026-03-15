# Maintainer: Inaha rin@notalium.co

pkgname=pjsk-cursor-theme
pkgver=0.0.2
pkgrel=1
pkgdesc="Project Sekai mouse cursors as X icon themes"
url="https://colorfulstage.com/media/download/"
license=('custom')
arch=('any')
makedepends=('bash' 'wget' 'unzip' 'win2xcur')
source=('pjsk_cursor.sh')
sha256sums=('4d454e02e53ce0eff0053f51a9d8e5aa39681e5d2a2b769cd9d2fa297742f2bf')

prepare() {
  chmod +x "$srcdir"/pjsk_cursor.sh
  cd "$srcdir"
  ./pjsk_cursor.sh
}

package() {
  install -dm755 "$pkgdir"/usr/share/icons
  cp -r "$srcdir"/packaged/* "$pkgdir"/usr/share/icons/
}

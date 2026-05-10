pkgname=iscsi-util
pkgver=2.0.1
pkgrel=2
pkgdesc="A simple and modern GUI for managing iSCSI."

arch=('x86_64')
license=('MIT')
depends=('open-iscsi' 'libnotify')
url="https://github.com/mijocecr/iscsi-util"
source=("https://github.com/mijocecr/iscsi-util/releases/download/iscsi-util_v2.1/ISCSI-Util.tar.gz")
sha256sums=('SKIP')

package() {
  # Instalar todo el bundle en /usr/lib/iscsi-util
  install -d "$pkgdir/usr/lib/iscsi-util"
  cp -r "$srcdir"/* "$pkgdir/usr/lib/iscsi-util/"

  # Crear symlink en /usr/bin
  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/iscsi-util/ISCSI-Util "$pkgdir/usr/bin/iscsi-util"

  # Desktop entry e icono
  install -Dm644 "$srcdir/iscsi-util.desktop" "$pkgdir/usr/share/applications/iscsi-util.desktop"
  install -Dm644 "$srcdir/iscsi-util.png" "$pkgdir/usr/share/pixmaps/iscsi-util.png"
}

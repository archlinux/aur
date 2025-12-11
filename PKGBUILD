pkgname=iscsi-util
pkgver=1.0.3
pkgrel=1
pkgdesc="GUI for an iSCSI initiator, a simple way to connect targets whitout write any command."

arch=('x86_64')
license=('MIT')
depends=('open-iscsi' 'libnotify')
url="https://github.com/mijocecr/Iniciador-iSCSI-GUI-Manjaro"
source=("https://github.com/mijocecr/Iniciador-iSCSI-GUI-Manjaro/releases/download/iscsi-util/ISCSI-Util.tar.gz")
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

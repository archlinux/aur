pkgname=samba-util
pkgver=2.9.9
pkgrel=3
pkgdesc="A simple and modern GUI for managing Samba."

arch=('x86_64')
license=('MIT')
depends=('samba' 'systemd' 'cifs-utils')
url="https://github.com/mijocecr/samba-util"
source=("https://github.com/mijocecr/samba-util/releases/download/samba-util_v3.0/SAMBA-Util.tar.gz")
sha256sums=('SKIP')

package() {
  # Instalar todo el bundle en /usr/lib/samba-util
  install -d "$pkgdir/usr/lib/samba-util"
  cp -r "$srcdir"/* "$pkgdir/usr/lib/samba-util/"

  # Crear symlink en /usr/bin
  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/samba-util/SAMBA-Util "$pkgdir/usr/bin/samba-util"

  # Desktop entry e icono
  install -Dm644 "$srcdir/samba-util.desktop" "$pkgdir/usr/share/applications/samba-util.desktop"
  install -Dm644 "$srcdir/samba-util.png" "$pkgdir/usr/share/pixmaps/samba-util.png"
}

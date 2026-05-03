pkgname=samba-util
pkgver=1.0.0
pkgrel=1
pkgdesc="A graphical tool for managing Samba"

arch=('x86_64')
license=('MIT')
depends=('samba' 'systemd')
url="https://github.com/mijocecr/samba-util"
source=("https://github.com/mijocecr/samba-util/releases/download/samba-util_v1.0/SAMBA-Util.tar.gz")
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

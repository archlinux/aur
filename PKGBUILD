pkgname=avahi-static-services
pkgver=1
pkgrel=1
pkgdesc="Configuration to advertise SSH & SFTP via Avahi"
arch=(any)
depends=(avahi)
backup=(etc/avahi/services/{ssh,sftp-ssh}.service)
source=({ssh,sftp-ssh}.service)
sha256sums=('83c63e090cf20cd1bca469dc9f2b549a6972ac99c3ea8a2a5df7c10b4b537579'
            '60a516f94e4da95dc65d7f39494d1920a1f64ed59b88579ec5e181b9ed203353')

package() {
  for f in *.service; do
    install -D -m 644 "$f" "$pkgdir/etc/avahi/services/$f"
  done
}

# vim: ts=2:sw=2:et:

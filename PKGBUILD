pkgname=flox
pkgver=0.6.0
pkgrel=2
pkgdesc="Flox Daemon and CLI"
arch=('x86_64')
url="https://beta.floxdev.com"
license=('unknown')

source=(
  "https://beta.floxdev.com/files/flox.tar.xz"
  "flox.service"
)
sha256sums=(
  "7b45c4dbed712332fc3e2e439cd9683dce445c4f8421fcb42174264136ece0b1"
  "SKIP"
)

package() {
  tar xfv "${srcdir}/flox.tar.xz" -C "${pkgdir}"
  install -D -m 644 "${srcdir}/flox.service" "${pkgdir}/usr/lib/systemd/system/flox.service"
  mv "${pkgdir}/usr/sbin/"* "${pkgdir}/usr/bin/"
  mv "${pkgdir}/usr/sbin/.npfs-client.uncle" "${pkgdir}/usr/bin/"
  rmdir "${pkgdir}/usr/sbin/"
}

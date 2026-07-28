# Maintainer: Kevin Stewart <kgstew96@gmail.com>
# pkgver must match a release tag whose assets include the RelayPony-linux-*.tar.gz builds.
pkgname=relaypony-bin
pkgver=2.0.3
pkgrel=1
pkgdesc="Encrypted, direct device-to-device file transfer - desktop app (prebuilt)"
arch=('x86_64' 'aarch64')
url="https://relaypony.app"
license=('Apache-2.0')
depends=('fontconfig')
provides=('relaypony')
conflicts=('relaypony')
options=(!strip)
source=(
  "relaypony.desktop::https://raw.githubusercontent.com/norsehorse-dev/RelayPonyDesktop/v$pkgver/packaging/aur/relaypony.desktop"
  "relaypony.png::https://raw.githubusercontent.com/norsehorse-dev/RelayPonyDesktop/v$pkgver/packaging/relaypony.png"
)
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/norsehorse-dev/RelayPonyDesktop/releases/download/v$pkgver/RelayPony-linux-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/norsehorse-dev/RelayPonyDesktop/releases/download/v$pkgver/RelayPony-linux-aarch64.tar.gz")
sha256sums=('SKIP' 'SKIP')
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
  install -dm755 "$pkgdir/opt/relaypony"
  cp -a "$srcdir/RelayPony/." "$pkgdir/opt/relaypony/"
  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/relaypony/bin/RelayPony "$pkgdir/usr/bin/relaypony"
  install -Dm644 "$srcdir/relaypony.desktop" "$pkgdir/usr/share/applications/relaypony.desktop"
  install -Dm644 "$srcdir/relaypony.png" "$pkgdir/usr/share/pixmaps/relaypony.png"
}

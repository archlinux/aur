# Maintainer: Kevin Stewart <kgstew96@gmail.com>
# pkgver must match a release tag whose assets include the RelayPony-linux-*.tar.gz builds.
pkgname=relaypony-bin
pkgver=2.1.0
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
sha256sums=('16787da2f5519724ec1a4852d4f0d097ddbeaeecd07d1c6ee1578f95b70b55b0'
            '2c8c079a0c414667c138c3d4b3af8568b24f54a03e26f2b61bb31fa2747a122f')
sha256sums_x86_64=('47c3024ac4572e447650f59359ac85bb527967b49fbc301af0478104978b285e')
sha256sums_aarch64=('7e126d8d2fd78949a1334937eb273608570505a11991455d26ad7effe9747c33')

package() {
  install -dm755 "$pkgdir/opt/relaypony"
  cp -a "$srcdir/RelayPony/." "$pkgdir/opt/relaypony/"
  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/relaypony/bin/RelayPony "$pkgdir/usr/bin/relaypony"
  install -Dm644 "$srcdir/relaypony.desktop" "$pkgdir/usr/share/applications/relaypony.desktop"
  install -Dm644 "$srcdir/relaypony.png" "$pkgdir/usr/share/pixmaps/relaypony.png"
}

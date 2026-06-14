# Maintainer: @aardbol
pkgname=picocrypt-ng-bin
pkgver=2.14
pkgrel=3
pkgdesc="A very small, very simple, yet very secure encryption tool. (GUI)"
arch=('x86_64' 'aarch64')
url="https://github.com/Picocrypt-NG/Picocrypt-NG"
license=('GPL3')
provides=('picocrypt-ng')
conflicts=('picocrypt-ng-git')
depends=(gtk3)
source_x86_64=(
  "${url}/releases/download/${pkgver}/Picocrypt-NG"
  "picocrypt.desktop"
)
source_aarch64=(
  "${url}/releases/download/${pkgver}/Picocrypt-NG-arm64"
  "picocrypt.desktop"
)
sha256sums_x86_64=(
  'a67519e14987ccd474c8f2cc9615860849feac8ff984565b9884681f5faad035'
  'd06954953bafc0fd9bb5edf609dff65ec0f0d95d971d096df7d72abe6e830e99'
)
sha256sums_aarch64=(
  '6bd678bb2ebb57e6cd4985f56f57f623065b4397efe2b13bce57ee7f948f3620'
  'd06954953bafc0fd9bb5edf609dff65ec0f0d95d971d096df7d72abe6e830e99'
)

package() {
    local srcbin
    case "$CARCH" in
        x86_64) srcbin="Picocrypt-NG" ;;
        aarch64) srcbin="Picocrypt-NG-arm64" ;;
    esac

    install -Dm755 "$srcdir/$srcbin" "$pkgdir/usr/bin/picocrypt-ng"
    install -Dm644 picocrypt.desktop "$pkgdir/usr/share/applications/picocrypt-ng.desktop"
}
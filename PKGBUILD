# Maintainer: ChoihHaram <altitudinem at google dot com>
pkgname=pipewire-web-remote-bin
_pkgname=pipewire-web-remote
pkgver=0.2.0
pkgrel=1
pkgdesc="A remote control web interface for PipeWire audio systems (Pre-compiled binary)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/oudeis01/pipewire-web-remote"
license=('MIT')
depends=('pipewire' 'wireplumber')
provides=("$_pkgname")
conflicts=("$_pkgname")
install="${_pkgname}.install"

source_x86_64=("$_pkgname-x86_64-$pkgver::${url}/releases/download/v${pkgver}/$_pkgname-x86_64")
source_aarch64=("$_pkgname-aarch64-$pkgver::${url}/releases/download/v${pkgver}/$_pkgname-aarch64")
source_armv7h=("$_pkgname-armv7h-$pkgver::${url}/releases/download/v${pkgver}/$_pkgname-armv7h")
source_license=("LICENSE-$pkgver::${url}/raw/v${pkgver}/LICENSE")
source_service=("pipewire-web-remote.service-$pkgver::${url}/raw/v${pkgver}/systemd/pipewire-web-remote.service")

source=("${source_license[@]}" "${source_service[@]}")
source_x86_64+=()
source_aarch64+=()
source_armv7h+=()
sha256sums=('SKIP')
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')
sha256sums_armv7h=('SKIP')

package() {
  install -Dm755 "$srcdir/$_pkgname-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/pipewire-web-remote.service-$pkgver" "$pkgdir/usr/lib/systemd/user/pipewire-web-remote.service"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

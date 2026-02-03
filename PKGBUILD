# Maintainer: ChoihHaram <altitudinem at google dot com>
pkgname=pipewire-web-remote-bin
_pkgname=pipewire-web-remote
pkgver=0.2.1
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
sha256sums=('SKIP' 'SKIP')
sha256sums_x86_64=('60eb987818db6085fb25203f8a90eecc6b95404d3217401de06424f9035aff58')
sha256sums_aarch64=('1547baacb9ceb6b2598e638a6ab0aaebcc7786d19b7a4311ac113977c6bc73a6')
sha256sums_armv7h=('66486892cd8c963b256e55c7dd801f45b41077867b7b405fd9153d74d3daf621')

package() {
  install -Dm755 "$srcdir/$_pkgname-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/pipewire-web-remote.service-$pkgver" "$pkgdir/usr/lib/systemd/user/pipewire-web-remote.service"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

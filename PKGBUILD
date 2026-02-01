# Maintainer: ChoihHaram <altitudinem at google dot com>
pkgname=pipewire-web-remote-bin
_pkgname=pipewire-web-remote
pkgver=0.1.1
pkgrel=1
pkgdesc="A remote control web interface for PipeWire audio systems (Pre-compiled binary)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/oudeis01/pipewire-web-remote"
license=('MIT')
depends=('pipewire' 'wireplumber')
provides=("$_pkgname")
conflicts=("$_pkgname")

source_x86_64=("$_pkgname-x86_64-$pkgver::${url}/releases/download/v${pkgver}/$_pkgname-x86_64")
source_aarch64=("$_pkgname-aarch64-$pkgver::${url}/releases/download/v${pkgver}/$_pkgname-aarch64")
source_armv7h=("$_pkgname-armv7h-$pkgver::${url}/releases/download/v${pkgver}/$_pkgname-armv7h")
source_license=("LICENSE-$pkgver::${url}/raw/v${pkgver}/LICENSE")

source=("${source_license[@]}")
source_x86_64+=()
source_aarch64+=()
source_armv7h+=()
sha256sums=('f9985372422f36e9618e96655c61ca70c8840b87a6c803ad42bcf450c52fb376')
sha256sums_x86_64=('60f70428e7c8893ba7f8aa913bc4f24c0c7816ea859ab685785141d64e9cd246')
sha256sums_aarch64=('084655550c823b04cfe54461ec71653d8d17ce639ff59abb76a59c005233f868')
sha256sums_armv7h=('aedf840f31d541e50a8ffdad9f05d3af09c42bcb3cdecc7cdfa3c00e85434705')

package() {
  install -Dm755 "$srcdir/$_pkgname-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

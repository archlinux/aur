# Maintainer: ChoihHaram <your_email@example.com>
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
sha256sums_x86_64=('c8297bb97fce406bc99eff550dbc011569b42df6e83f6b065b0e414ceed72e52')
sha256sums_aarch64=('8c1a02ecab0c751d865238cdf166b11f999d49f704c1ef79172fef1bb4555fe3')
sha256sums_armv7h=('cd04b715349a53a5b7baff3a094d6dd99f0c3574f95f8c5416dc4c1247ad32d7')

package() {
  install -Dm755 "$srcdir/$_pkgname-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

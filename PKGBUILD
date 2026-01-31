# Maintainer: ChoihHaram <your_email@example.com>
pkgname=pipewire-web-remote-bin
_pkgname=pipewire-web-remote
pkgver=0.1.1
pkgrel=1
pkgdesc="A remote control web interface for PipeWire audio systems (Pre-compiled binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/oudeis01/pipewire-web-remote"
license=('MIT')
depends=('pipewire' 'wireplumber')
provides=("$_pkgname")
conflicts=("$_pkgname")

source_x86_64=("$_pkgname-x86_64-$pkgver::${url}/releases/download/v${pkgver}/$_pkgname-x86_64")
source_aarch64=("$_pkgname-aarch64-$pkgver::${url}/releases/download/v${pkgver}/$_pkgname-aarch64")
source_license=("LICENSE-$pkgver::${url}/raw/v${pkgver}/LICENSE")

source=("${source_license[@]}")
source_x86_64+=()
source_aarch64+=()
sha256sums=('f9985372422f36e9618e96655c61ca70c8840b87a6c803ad42bcf450c52fb376')
sha256sums_x86_64=('7450cc629da7f3df5559ebbcb2731dc4f60a6f2d3028d4b5bf4b0146a1f12fe0')
sha256sums_aarch64=('c2976d892e98bff3111067bd76f426a18fee17b80205254aa995bf438d25ff55')

package() {
  install -Dm755 "$srcdir/$_pkgname-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

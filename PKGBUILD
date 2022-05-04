# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=udp-over-tcp
pkgver=0.2.0
pkgrel=1
pkgdesc="Proxy UDP traffic over a TCP stream"
arch=('i686' 'x86_64')
url="https://github.com/mullvad/udp-over-tcp"
license=('apache' 'MIT')
depends=()
makedepends=('git' 'rust')
source=("https://github.com/mullvad/udp-over-tcp/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2879d579533154b7825b59c22bb9287a99cc017e0377fe2526313822eebd1ba6')

package() {
  cd "$srcdir"/udp-over-tcp-"$pkgver"

  cargo install \
    --all-features \
    --no-track \
    --locked \
    --root "$pkgdir/usr" \
    --path .
}

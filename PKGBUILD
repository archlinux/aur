# Maintainer: Wayne Martin <ghwinslow1700@hotmail.com>
pkgname=homelabcheck
pkgver=0.1.0
pkgrel=1
pkgdesc="Fast CLI health check for self-hosted homelab infrastructure — Docker, disk, memory, and load"
arch=('x86_64')
url="https://github.com/Wtmartin8089/homelabcheck"
license=('MIT')
depends=('docker')
optdepends=('docker: container health checks')
provides=('homelabcheck')
conflicts=('homelabcheck-git')
source=(
    "$pkgname-$pkgver::$url/releases/download/v$pkgver/$pkgname"
    "LICENSE::$url/raw/main/LICENSE"
)
sha256sums=(
    'f8cfa8a3aa2cce3abca2a91f8781a9d17b9c08db24585f68f0649faee98ca469'
    'SKIP'
)

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

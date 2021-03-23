# Maintainer: Andy Bao <contact at andybao dot me>
pkgname=pterodactyl-daemon-bin
pkgname1=wings
githuborg=pterodactyl
pkgdesc="Open-source server control and management daemon for pterodactyl-panel ($pkgname1)."
pkgver=1.3.1
pkgpath="github.com/$githuborg/$pkgname1"
pkgrel=1
arch=('any')
url="https://${pkgpath}"
license=('MIT')
makedepends=()
conflicts=(pterodactyl-daemon)
provides=(pterodactyl-daemon)
depends=(docker)
options=(!strip)
source_x86_64=("$pkgname1-$pkgver::$url/releases/download/v$pkgver/wings_linux_amd64" "$pkgname1.service")
source_aarch64=("$pkgname1-$pkgver::$url/releases/download/v$pkgver/wings_linux_arm64" "$pkgname1.service")
sha256sums_x86_64=(
    'bc6bd12125c41c5b1212fb83b1fa72607806f257276261e70c79c4d28f6b8ac6'
    '3b4e24e3bfb5ec24641f56ac342b58b164882206686d1764c46467aef5a1aaee'
)
sha256sums_aarch64=(
    '60c89af83216d0f1a49ecf79ea48caef5874ba7a31d4b3e6f5c0e630835c2bdb'
    '3b4e24e3bfb5ec24641f56ac342b58b164882206686d1764c46467aef5a1aaee'
)

package() {
    mkdir -p "$pkgdir/etc/pterodactyl"
    install -Dm755 "$pkgname1-$pkgver" "$pkgdir/usr/local/bin/$pkgname1"
	install -Dm644 "$pkgname1.service" -t "$pkgdir/usr/lib/systemd/system/"
}

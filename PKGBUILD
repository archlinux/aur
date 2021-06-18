# Maintainer: Andy Bao <contact at andybao dot me>
pkgname=pterodactyl-daemon-bin
pkgname1=wings
githuborg=pterodactyl
pkgdesc="Open-source server control and management daemon for pterodactyl-panel ($pkgname1)."
pkgver=1.4.3
pkgrel=2
arch=('x86_64' 'aarch64')
url="https://github.com/$githuborg/$pkgname1"
license=('MIT')
conflicts=('pterodactyl-daemon')
provides=('pterodactyl-daemon')
depends=('docker')
options=(!strip)
source_x86_64=("$pkgname1-$pkgver-x86_64::$url/releases/download/v$pkgver/wings_linux_amd64" "$pkgname1.service")
source_aarch64=("$pkgname1-$pkgver-aarch64::$url/releases/download/v$pkgver/wings_linux_arm64" "$pkgname1.service")
sha256sums_x86_64=(
    '545e51967b357a3d9f4da11a4ae2fcd953577ae2db9511b40b8377c8bbf0c7df'
    'SKIP'
)
sha256sums_aarch64=(
    'c6d02fca84b0ca4c20285a1e8767717f6291c74b6a13f48a15551a73c1bb816e'
    'SKIP'
)

package() {
    mkdir -p "$pkgdir/etc/pterodactyl"
    install -Dm755 "$pkgname1-$pkgver-$CARCH" "$pkgdir/usr/bin/$pkgname1"
	install -Dm644 "$pkgname1.service" -t "$pkgdir/usr/lib/systemd/system/"
}

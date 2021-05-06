# Maintainer: Andy Bao <contact at andybao dot me>
pkgname=pterodactyl-daemon-bin
pkgname1=wings
githuborg=pterodactyl
pkgdesc="Open-source server control and management daemon for pterodactyl-panel ($pkgname1)."
pkgver=1.4.2
pkgrel=1
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
    'bb33bea4ed7153297cf952480993c8490452d049f3e2ce18157236828fbbe909'
    '34429a141df3e257b2396cd56aa6c0df4e3878dc00d42f7651672b4a6bbb0021'
)
sha256sums_aarch64=(
    'd015aa6d39f16741713e2de0bb53652d5a39a120824cde8cd82c65b6343b05d9'
    '34429a141df3e257b2396cd56aa6c0df4e3878dc00d42f7651672b4a6bbb0021'
)

package() {
    mkdir -p "$pkgdir/etc/pterodactyl"
    install -Dm755 "$pkgname1-$pkgver-$CARCH" "$pkgdir/usr/local/bin/$pkgname1"
	install -Dm644 "$pkgname1.service" -t "$pkgdir/usr/lib/systemd/system/"
}

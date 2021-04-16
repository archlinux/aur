# Maintainer: Andy Bao <contact at andybao dot me>
pkgname=pterodactyl-daemon-bin
pkgname1=wings
githuborg=pterodactyl
pkgdesc="Open-source server control and management daemon for pterodactyl-panel ($pkgname1)."
pkgver=1.3.2
pkgrel=2
arch=('x86_64' 'aarch64')
url="https://github.com/$githuborg/$pkgname1"
license=('MIT')
conflicts=('pterodactyl-daemon')
provides=('pterodactyl-daemon')
depends=('docker')
options=(!strip)
source_x86_64=("$pkgname1-$pkgver::$url/releases/download/v$pkgver/wings_linux_amd64" "$pkgname1.service")
source_aarch64=("$pkgname1-$pkgver::$url/releases/download/v$pkgver/wings_linux_arm64" "$pkgname1.service")
sha256sums_x86_64=(
    'adf6a86345ff619191b8444fcc5b53fc82888f5a4196d9c0cf6283d612548175'
    '34429a141df3e257b2396cd56aa6c0df4e3878dc00d42f7651672b4a6bbb0021'
)
sha256sums_aarch64=(
    '5247bacd5421e1082f611656aaabcecc9c0c5d02dbff059649be5c3e512717f9'
    '34429a141df3e257b2396cd56aa6c0df4e3878dc00d42f7651672b4a6bbb0021'
)

package() {
    mkdir -p "$pkgdir/etc/pterodactyl"
    install -Dm755 "$pkgname1-$pkgver" "$pkgdir/usr/local/bin/$pkgname1"
	install -Dm644 "$pkgname1.service" -t "$pkgdir/usr/lib/systemd/system/"
}

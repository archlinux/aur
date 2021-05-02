# Maintainer: Andy Bao <contact at andybao dot me>
pkgname=pterodactyl-daemon-bin
pkgname1=wings
githuborg=pterodactyl
pkgdesc="Open-source server control and management daemon for pterodactyl-panel ($pkgname1)."
pkgver=1.4.1
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
    'b8351b81defbf210b26d0a7a52cad77f66cab29722603d5a015880ffe173dc5d'
    '34429a141df3e257b2396cd56aa6c0df4e3878dc00d42f7651672b4a6bbb0021'
)
sha256sums_aarch64=(
    '7e91edaa28397b764f4e7f99ef050162ed1666f3bbaf57d1c7ab6c78eb6069fb'
    '34429a141df3e257b2396cd56aa6c0df4e3878dc00d42f7651672b4a6bbb0021'
)

package() {
    mkdir -p "$pkgdir/etc/pterodactyl"
    install -Dm755 "$pkgname1-$pkgver-$CARCH" "$pkgdir/usr/local/bin/$pkgname1"
	install -Dm644 "$pkgname1.service" -t "$pkgdir/usr/lib/systemd/system/"
}

# Maintainer: Andy Bao <contact at andybao dot me>
pkgname=pterodactyl-daemon-bin
pkgname1=wings
githuborg=pterodactyl
pkgdesc="Open-source server control and management daemon for pterodactyl-panel ($pkgname1)."
pkgver=1.4.0
pkgrel=1
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
    '4a8e73e1ae5c92963f343577fd92c979f368a7bc0219d330b8510b2bedbd8e5a'
    '34429a141df3e257b2396cd56aa6c0df4e3878dc00d42f7651672b4a6bbb0021'
)
sha256sums_aarch64=(
    '7cfa1344ec54cfca2db1963684d91e7838e57be95380d41ce2eda50f1a77a868'
    '34429a141df3e257b2396cd56aa6c0df4e3878dc00d42f7651672b4a6bbb0021'
)

package() {
    mkdir -p "$pkgdir/etc/pterodactyl"
    install -Dm755 "$pkgname1-$pkgver" "$pkgdir/usr/local/bin/$pkgname1"
	install -Dm644 "$pkgname1.service" -t "$pkgdir/usr/lib/systemd/system/"
}

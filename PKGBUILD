pkgname=mullvad-socks-bin
pkgver=1.4.1
pkgrel=1
pkgdesc="Filter Mullvad's SOCKS5 proxies by country, city, weight and online status."
url='https://github.com/APT37/mullvad-socks'
arch=('x86_64')
license=('MIT-0')
source=("mvs-cli+$pkgver::$url/releases/download/$pkgver/mvs-cli" "mvs-web+$pkgver::$url/releases/download/$pkgver/mvs-web")
sha256sums=('185d99794b667c3e3e9413677d862925581e3946af08fb53488e3a59c79e0ead'
            '24805f410d49011639929bdbf3513c18c6c93ac5690f34a473b4d37222e7ecb1')
options=('!lto')
provides=('mullvad-socks')
conflicts=('mullvad-socks' 'mullvad-socks-git')

package() {
    install -Dm755 "mvs-cli+$pkgver" "$pkgdir/usr/bin/mvs-cli"
    install -Dm755 "mvs-web+$pkgver" "$pkgdir/usr/bin/mvs-web"
}

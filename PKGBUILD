pkgname=mullvad-socks-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Filter Mullvad's SOCKS5 proxies by country, city, weight and online status."
url='https://github.com/APT37/mullvad-socks'
arch=('x86_64')
license=('MIT-0')
source=("mvs-cli+$pkgver::$url/releases/download/$pkgver/mvs-cli" "mvs-web+$pkgver::$url/releases/download/$pkgver/mvs-web")
sha256sums=('e56314c7372f5dd930a8eedb48036a20cf8ccb19754c3db85ef26fdef1505f7f'
            'eafd57133aee1699c9e6e06ac9c3ce47b8b9b8e610e0a0728b82463591127c40')
options=('!lto')
provides=('mullvad-socks')
conflicts=('mullvad-socks' 'mullvad-socks-git')

package() {
    install -Dm755 "mvs-cli+$pkgver" "$pkgdir/usr/bin/mvs-cli"
    install -Dm755 "mvs-web+$pkgver" "$pkgdir/usr/bin/mvs-web"
}

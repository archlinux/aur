# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=continuwuity-bin
_name=${pkgname%-bin}
pkgver=0.5.3
pkgrel=1
pkgdesc='Community driven continuation of conduwuit & Conduit, focusing on user experience and new features'
arch=(x86_64 aarch64)
url="https://forgejo.ellis.link/continuwuation/$_name"
license=(Apache-2.0)
depends=(gcc-libs glibc liburing.so)
provides=(conduwuit)
conflicts=(conduwuit)
backup=(etc/conduwuit/conduwuit.toml)
options=(!debug)
source_x86_64=("$_name-$pkgver-x86_64::$url/releases/download/v$pkgver/conduwuit-linux-amd64")
source_aarch64=("$_name-$pkgver-aarch64::$url/releases/download/v$pkgver/conduwuit-linux-arm64")
source=("$_name-$pkgver-LICENSE::$url/raw/tag/v$pkgver/LICENSE"
        "$_name-$pkgver-conduwuit.service::$url/raw/tag/v$pkgver/pkg/conduwuit.service"
        "$_name-$pkgver-conduwuit-example.toml::$url/raw/tag/v$pkgver/conduwuit-example.toml")
b2sums=('05c474bd372cbb4f52a93982812b2ff8d6a38df6168ad673c8c2a7662ae5a23932b666c0997efec85c13b8a622f2ea4817bc7dc1560f9ed48ff914403595cba7'
        'da2f5e3778d8c62023d694969b37ecfed754ad2d8dc43c7cba44218618bbb95bade515537b41d22cb3222adeec4ef9074c5e8fc3f101c364751f2f4868dba96f'
        'f023370df2acb507d50795625e7ca1ea4b46452e93c369e6eddd86514405e6b1d21c72b4b5c05ade2e1d84a5ce2a1827dbe92b6c248225fb598b61878a74863f')
b2sums_x86_64=('97874f9cebac51278821a2e0242947bf54e63e283d7975737d7f55322f9fa26e0e40c50bc4d9b0162df8ef5dc93a139fae43c6ddf2ba70d5eaafeb289b529b38')
b2sums_aarch64=('fd7b0b2a03ae44ce6ea672fe1b9adc8209deb50e8ad50f2639be069f3f94ca1dd08eec71c6cd077e7465aa086765bc5364b4a52477e94a6cfe3990d29f82aaf3')

package() {
    install -Dm755 $_name-$pkgver-$CARCH "$pkgdir/usr/bin/conduwuit"
    install -Dm755 $_name-$pkgver-LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 $_name-$pkgver-conduwuit.service "$pkgdir/usr/lib/systemd/system/$_name.service"
    install -Dm600 $_name-$pkgver-conduwuit-example.toml "$pkgdir/etc/conduwuit/conduwuit.toml"
}

# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=continuwuity-bin
_name=${pkgname%-bin}
pkgver=0.5.4
pkgrel=1
pkgdesc='Community driven continuation of conduwuit & Conduit, focusing on user experience and new features'
arch=(x86_64 aarch64)
url="https://forgejo.ellis.link/continuwuation/$_name"
license=(Apache-2.0)
depends=(gcc-libs glibc liburing.so)
provides=(conduwuit $_name)
conflicts=(conduwuit $_name)
backup=(etc/conduwuit/conduwuit.toml)
options=(!debug)
source_x86_64=("$_name-$pkgver-x86_64::$url/releases/download/v$pkgver/conduwuit-linux-amd64")
source_aarch64=("$_name-$pkgver-aarch64::$url/releases/download/v$pkgver/conduwuit-linux-arm64")
source=("$_name-$pkgver-LICENSE::$url/raw/tag/v$pkgver/LICENSE"
        "$_name-$pkgver-conduwuit.service::$url/raw/tag/v$pkgver/pkg/conduwuit.service"
        "$_name-$pkgver-conduwuit-example.toml::$url/raw/tag/v$pkgver/conduwuit-example.toml")
b2sums=('05c474bd372cbb4f52a93982812b2ff8d6a38df6168ad673c8c2a7662ae5a23932b666c0997efec85c13b8a622f2ea4817bc7dc1560f9ed48ff914403595cba7'
        'da2f5e3778d8c62023d694969b37ecfed754ad2d8dc43c7cba44218618bbb95bade515537b41d22cb3222adeec4ef9074c5e8fc3f101c364751f2f4868dba96f'
        '6c078a530d3d5fbb43199d8e6576477c8bccb2a6c5320cbcf2490c0214269252798a5bd212d6e6320c849dce2600edc92d6274f65341f5834bd5ed9b011289bb')
b2sums_x86_64=('f1b66f537727e204b5e814892efa2d90828be5c8703f795563b2b25db90bff62549b51edd145cc3bcf3dde39b149e5e4524bde9dd0a72033a0466cd8d1d5b61e')
b2sums_aarch64=('7e967513da9f87e57ebb57be9b2bb4120c16d177f217d2c21ab57f59e873c06c0ba5bc3303970318743c6bc41b1d270e5e1500efddacdd15dc5621a1cd22116b')

package() {
    install -Dm755 $_name-$pkgver-$CARCH "$pkgdir/usr/bin/conduwuit"
    install -Dm755 $_name-$pkgver-LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 $_name-$pkgver-conduwuit.service "$pkgdir/usr/lib/systemd/system/$_name.service"
    install -Dm600 $_name-$pkgver-conduwuit-example.toml "$pkgdir/etc/conduwuit/conduwuit.toml"
}

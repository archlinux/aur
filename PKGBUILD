# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=continuwuity-bin
_name=${pkgname%-bin}
pkgver=26.8.1
pkgrel=1
pkgdesc='Community driven continuation of conduwuit & Conduit, focusing on user experience and new features'
arch=(x86_64 aarch64)
url=https://forgejo.ellis.link/continuwuation/$_name
license=(Apache-2.0)
depends=(glibc libgcc libstdc++ liburing)
provides=(conduwuit $_name)
conflicts=(conduwuit $_name)
backup=(etc/conduwuit/conduwuit.toml)
options=(!debug)
source_x86_64=($_name-$pkgver-x86_64::$url/releases/download/v$pkgver/conduwuit-linux-amd64)
source_aarch64=($_name-$pkgver-aarch64::$url/releases/download/v$pkgver/conduwuit-linux-arm64)
source=($_name-$pkgver-LICENSE::$url/raw/tag/v$pkgver/LICENSE
        $_name-$pkgver-CHANGELOG.md::$url/raw/tag/v$pkgver/CHANGELOG.md
        $_name-$pkgver-conduwuit.service::$url/raw/tag/v$pkgver/pkg/conduwuit.service
        $_name-$pkgver-conduwuit-example.toml::$url/raw/tag/v$pkgver/conduwuit-example.toml)
b2sums=('518d931ec3677f070b113790e4aa9ee45ed1e4b9db4b15c08ef72f62eb82f4778347a55fa7cd61cc1654c012cdc0b52f0cf5d05444b20c7e9a002f8d3088c276'
        '3d3916c6f7fbcc48fca991f7643ad23c8c97159bbb5bdceaaf5472518c5d473b65140706252701bccba0c05dbbebac1d9354cfbe257996c522949b7bd4d01594'
        '1a7146581c3cedef312287589c5189e02ef205e08e997af3604a472b2584466c693d52ca8cda254d2202d50bd46af65bda049b3b1f1fc00aaa074cbcb31e0e73'
        'e91561b83d3ecdded7b7b8a44ff2199b63a8c24b400200e0e5c7f1cdd12a2d34d8d4834c451b16acb4633687dc962368a8e67f13d13b71aa094e87fea6819136')
b2sums_x86_64=('19e1e76fe5943bc417084ecac245a4bc21606ba9c5ab126b56f4065b8178761a7bdc31ce778462512b905b7f00e24477fef0f5294421e6a19d9fc74c87b01490')
b2sums_aarch64=('f8545d3d5cf8f951b8bafecc53aacbbdf9752fc72390049bc72343e79eabb03b432d3586897f9ad2f1225f516d94eb6550e94ff10a3750dbef36a87de8598256')

package() {
    install -Dm755 $_name-$pkgver-$CARCH "$pkgdir/usr/bin/conduwuit"
    install -Dm644 $_name-$pkgver-LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 $_name-$pkgver-CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
    install -Dm644 $_name-$pkgver-conduwuit.service "$pkgdir/usr/lib/systemd/system/$_name.service"
    install -Dm600 $_name-$pkgver-conduwuit-example.toml "$pkgdir/etc/conduwuit/conduwuit.toml"
}

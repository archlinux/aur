# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=continuwuity-bin
_name=${pkgname%-bin}
pkgver=26.7.3
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
        '8770ac4a027f952ac7e0ad0e8d8f4b52ca5ae22a1a9e0b3788cff40e8a891bd66387a24331a7426c7e2a4197523884962e58f4635a2d1c81ed3e68f2e67b3307'
        '1a7146581c3cedef312287589c5189e02ef205e08e997af3604a472b2584466c693d52ca8cda254d2202d50bd46af65bda049b3b1f1fc00aaa074cbcb31e0e73'
        '2ffb6167c9d7bab9f30a6320a06576679c5018b6baf2818c6f83dc5e49479aefac1210834897137afa1ba3a6d432c38b53a09420e56f2ed3f9340709dc4544cb')
b2sums_x86_64=('35fdd32c5ffaa7201c53ca1ca9d6e2df6d234c0ba3dde77b9cd13e85d50c025396d241baa9052ea48c7099067405de827afe59867b64b26e4639a01885c398c3')
b2sums_aarch64=('3f7b56be1ee5f145b7ef8df73aafb40a52d90dcbaa9383d541d774d3e80f88f83f4d5b9a6f2b9e0ae87df4e6e55d35d81d412f0a8cf3c51bcb208d56680be673')

package() {
    install -Dm755 $_name-$pkgver-$CARCH "$pkgdir/usr/bin/conduwuit"
    install -Dm644 $_name-$pkgver-LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 $_name-$pkgver-CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
    install -Dm644 $_name-$pkgver-conduwuit.service "$pkgdir/usr/lib/systemd/system/$_name.service"
    install -Dm600 $_name-$pkgver-conduwuit-example.toml "$pkgdir/etc/conduwuit/conduwuit.toml"
}

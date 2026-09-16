# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=continuwuity-bin
_name=${pkgname%-bin}
pkgver=26.9.0
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
        '76157760c82c87456a614704a16493d9b17684c62ccf4a7c62d4de46090f13a9ca4419073505967417d9c6c33a05455f543590e74c82d6326ecc0f50afcb2e80'
        '1a7146581c3cedef312287589c5189e02ef205e08e997af3604a472b2584466c693d52ca8cda254d2202d50bd46af65bda049b3b1f1fc00aaa074cbcb31e0e73'
        'e8ffc238d3dfb527c1a08ac875373605fdf837cfbd459be7fc70f655b38fe689d984bc440e7a07b77d3532a9c14d269ac016a86e52f5bfce20e19ec7e0a97419')
b2sums_x86_64=('f2d36b6b30dee5766f9dd39910e7425228483073f035a208941d0b5e1fa02b0a7d9c846b0436cdc28bd2290e8af3ad345c6db71fd23f6e509c4c94648dac4efe')
b2sums_aarch64=('3fde369cb82c6d73518871c0f33e49cbfec61d572a85ac404906a3b73002eb60e4b5a04573be47a47403b5edfd235dd3982816db21a3408e1cb7540e026c851e')

package() {
    install -Dm755 $_name-$pkgver-$CARCH "$pkgdir/usr/bin/conduwuit"
    install -Dm644 $_name-$pkgver-LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 $_name-$pkgver-CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
    install -Dm644 $_name-$pkgver-conduwuit.service "$pkgdir/usr/lib/systemd/system/$_name.service"
    install -Dm600 $_name-$pkgver-conduwuit-example.toml "$pkgdir/etc/conduwuit/conduwuit.toml"
}

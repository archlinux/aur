# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=continuwuity-bin
_name=${pkgname%-bin}
pkgver=26.6.2
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
        '603f0881130ce0229ee042c68ee0b4bfa23b1f10c8bfb7c3df718bb34359c4522e4287af51c6e890b630753c5523b16c31101e4ddee364b6b3426092253f9434'
        '1a7146581c3cedef312287589c5189e02ef205e08e997af3604a472b2584466c693d52ca8cda254d2202d50bd46af65bda049b3b1f1fc00aaa074cbcb31e0e73'
        '78979678f6f1c7c7b130d55893a92240688a330c132dc623192953fb841cfef048b14b1449ab4c4ff6a7bfd6e5048b10ac5909ed48a060e7d105016fe4255f8b')
b2sums_x86_64=('ea39230d73840a860403036953942efa4b6d895cd465b2f59e63cb04f9daa18d7610b04317ea4c48c9fad85ee35428107a2bcd5388c3f2e95c2f8b2938dba704')
b2sums_aarch64=('7c36df6fb0089df42464f603c1ca1468244c130efd73e8b05879dcdd0639e7480f33192d93f498df944dd556fec8da1721947973e470412d9163c00298dfa037')

package() {
    install -Dm755 $_name-$pkgver-$CARCH "$pkgdir/usr/bin/conduwuit"
    install -Dm644 $_name-$pkgver-LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 $_name-$pkgver-CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
    install -Dm644 $_name-$pkgver-conduwuit.service "$pkgdir/usr/lib/systemd/system/$_name.service"
    install -Dm600 $_name-$pkgver-conduwuit-example.toml "$pkgdir/etc/conduwuit/conduwuit.toml"
}

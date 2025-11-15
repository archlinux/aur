# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=astroterm-bin
_name=${pkgname%-bin}
pkgver=1.0.9
pkgrel=2
pkgdesc='A planetarium for your terminal'
arch=('x86_64')
url='https://github.com/da-luce/astroterm'
license=('MIT')
depends=('glibc')
provides=("$_name")
conflicts=("$_name")
source=(
    "LICENSE-$pkgver::https://raw.githubusercontent.com/da-luce/$_name/refs/tags/v$pkgver/LICENSE"
    "README-$pkgver.md::https://raw.githubusercontent.com/da-luce/$_name/refs/tags/v$pkgver/README.md"
)
source_x86_64=("$_name-$pkgver::https://github.com/da-luce/$_name/releases/download/v$pkgver/$_name-linux-x86_64")
sha256sums=('dcf125d76a777af20283b8cc797ded8d3eeb7d57a1ad1f642493a13764c60a29'
            'e2c694d890af48965c251519f6dd7c4c96aa314c8f2bf3ddd265ec6100acd874')
sha256sums_x86_64=('c4c1b5f5d0f57675ca0d9cbc298403ffe45152686e8b4a56382862dc763cc0c4')

package() {
    install -Dm755 $_name-$pkgver "$pkgdir/usr/bin/$_name"
    install -Dm644 README-$pkgver.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE-$pkgver "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

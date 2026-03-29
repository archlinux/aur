# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=astroterm-bin
_name=${pkgname%-bin}
pkgver=1.1.0
pkgrel=1
pkgdesc='A planetarium for your terminal'
arch=(x86_64)
url='https://github.com/da-luce/astroterm'
license=(MIT)
depends=(glibc)
provides=($_name)
conflicts=($_name)
source=(LICENSE-$pkgver::https://raw.githubusercontent.com/da-luce/$_name/refs/tags/v$pkgver/LICENSE
        README-$pkgver.md::https://raw.githubusercontent.com/da-luce/$_name/refs/tags/v$pkgver/README.md)
source_x86_64=("$_name-$pkgver::$url/releases/download/v$pkgver/$_name-linux-x86_64")
sha256sums=('dcf125d76a777af20283b8cc797ded8d3eeb7d57a1ad1f642493a13764c60a29'
            'ffeab0dd661b4a258f1df40fe046931003fc8baeca868b2ab2749896757ee1bc')
sha256sums_x86_64=('6001caa417b9a818a44c9b2242314dc411a5b5f65debdad578af9b894685ef73')

package() {
    install -Dm755 $_name-$pkgver "$pkgdir/usr/bin/$_name"
    install -Dm644 README-$pkgver.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE-$pkgver "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

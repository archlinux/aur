# Maintainer: Toastberries <toast@toastberries.xyz>

pkgname='fcitx5-sitelen-pona'
pkgver=1.0.0
pkgrel=1
pkgdesc="fcitx5 table for translating latin characters into toki pona's sitelen pona glyphs"
arch=('any')
url="https://github.com/Toastberries/$pkgname"
license=('MIT')
depends=('fcitx5' 'fcitx5-chinese-addons' 'hicolor-icon-theme')
makedepends=('libime')
source=("$pkgname-$pkgver::$url/archive/v$pkgver.tar.gz")
sha256sums=('e8692e018bf5bbd6a7256b2aac88abb5f0d5d6863784f3f71aa6a6a3de128451')

build() {
	cd "$pkgname-$pkgver"
	./install.sh build-only
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	DESTDIR="$pkgdir" ./install.sh install-only
}

# Maintainer: Heptazhou <zhou at 0h7z dot com>

pkgname=locale-mul_zz
pkgname_=locale
url="https://github.com/0h7z/$pkgname_"
pkgver_=$(curl -Is $url/releases/latest | grep -Po "^location:.+\/v\K\S+")
pkgver=$(echo $pkgver_ | grep -Po ".+(?=-)")
pkgrel=3
pkgdesc="Multiple locales following UTC, UTF-8, and ISO 8601"
arch=("any")
# url
license=("AGPL3")
depends=("glibc")
install="locale.install"
source=("$pkgname-v$pkgver_.tar.gz::$url/archive/v$pkgver_.tar.gz")
sha256sums=("SKIP")
pkgdir_="usr/share/i18n/locales"

package() {
	cd -- "$srcdir/$pkgname_-$pkgver_/$pkgdir_"
	install -Dm644 -t "$pkgdir/$pkgdir_" "en_ZZ"
	install -Dm644 -t "$pkgdir/$pkgdir_" "zh_ZZ"
}

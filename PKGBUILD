# Maintainer: Heptazhou <heptazhou at icloud dot com>

pkgname=locale-mul_zz
pkgname_=locale
pkgver_=$(curl -Is https://github.com/Heptazhou/$pkgname_/releases/latest | grep -Po "^location:.+\/v\K\S+")
pkgver=$(echo $pkgver_ | grep -Po ".+(?=-)")
pkgrel=1
pkgdesc="Multiple locales following UTC, UTF-8, and ISO 8601"
arch=("any")
url="https://github.com/Heptazhou/$pkgname_"
license=("AGPL3")
depends=("glibc")
source=("$pkgname-v$pkgver_.tar.gz::https://github.com/Heptazhou/$pkgname_/archive/v$pkgver_.tar.gz")
sha256sums=("SKIP")
pkgdir_="usr/share/i18n/locales"

package() {
	cd -- "$srcdir/$pkgname_-$pkgver_"
	install -Dm644 -t "$pkgdir/$pkgdir_" "$pkgdir_/zh_ZZ"
	install -Dm644 -t "$pkgdir/$pkgdir_" "$pkgdir_/en_ZZ"
}

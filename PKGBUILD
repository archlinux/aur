# Maintainer: Leon Schumacher <leonsch@protonmail.com>
# vim: ft=sh:
pkgname=shsysusers
pkgver=4
pkgrel=1
pkgdesc="A replacement for systemd-sysusers written in bash "
arch=('any')
url="https://github.com/42LoCo42/shsysusers"
license=('GPL')
depends=('bash')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
	'20-shsysusers.hook'
)
sha256sums=('dc2b77214e379ff9fdea9c0e0aa2785b492d0ebe0bfb6d887b25f234831681d9'
            'fe6eb1752d6b4a08b34c13276a19b5b521c700348e405cdbd74e13cdf7c8c07b')

package() {
	install -Dm755 "$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "20-shsysusers.hook" "$pkgdir/usr/share/libalpm/hooks/20-shsysusers.hook"
}

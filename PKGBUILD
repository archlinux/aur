# Maintainer: Leon Schumacher <leonsch@protonmail.com>
# vim: ft=sh:
pkgname=shsysusers
pkgver=2
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
sha256sums=(
	'4427ef5b61ad546e179a750cd04b4655ba5c4fbb801fb7770898dc8482bb59d5'
	'fe6eb1752d6b4a08b34c13276a19b5b521c700348e405cdbd74e13cdf7c8c07b'
)

package() {
	install -Dm755 "$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "20-shsysusers.hook" "$pkgdir/usr/share/libalpm/hooks/20-shsysusers.hook"
}

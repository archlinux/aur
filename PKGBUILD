# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname='ibus-daemon'
pkgver='0.0.4'
pkgrel='1'
pkgdesc='SystemD user service for IBus'
arch=('any')
license=('MIT')
url='https://github.com/KSXGitHub/ibus-daemon.pkgbuild.git'
depends=(
	'systemd'
	'ibus'
	'sh'
)
source=(
	'ibus@.service'
	'ibus-config@.service'
	'enable-ibus-daemon'
	'LICENSE.md'
	'README.md'
)
sha512sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
)

package() {
	cd "$srcdir"
	install -Dm644 ibus@.service "$pkgdir/usr/lib/systemd/user/ibus@.service"
	install -Dm644 ibus-config@.service "$pkgdir/usr/lib/systemd/user/ibus-config@.service"
	install -Dm755 enable-ibus-daemon "$pkgdir/usr/bin/enable-ibus-daemon"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

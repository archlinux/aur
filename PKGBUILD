# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Oliver Jaksch <arch-aur at com-in dot de>

pkgname=romvault
pkgver=3.5.0
pkgrel=1
pkgdesc="A tool for managing your ROMs and DATs for emulators"
arch=('x86_64')
url="https://romvault.com"
license=('Apache')
depends=('mono')
install=$pkgname.install
source=(
	"$pkgname-$pkgver.zip::$url/download/ROMVault_V$pkgver.zip"
	'LICENSE'
	"$pkgname.sh"
	'chdman.sh'
	"$pkgname.desktop"
	"$pkgname.png"
	'tmpfiles.d.conf')
sha256sums=('cd4f6e2615e91b216100f6874701c6844e558c0d96c10cfbff8376b39b740908'
            '996bf0d32dc11506ea2635d64474c24399fab25933463f27d70cfa1d50431a16'
            '500dc99b01b151cfc8fba646ffc38cc7f34ca734f54e5126705ab3f0ee6f5ced'
            '7970f3966dee1f9aa7d5b311753dbeaa7a7878e9fa7cb14e6be886900706a41d'
            'e289bf838cf51eacfcee48bbe468139ea6b4df3fff97ac1618bb7ba0ac9afd7d'
            'd368d14e844f2dd6f5b2d04b31d9a70f0af6f3ec72669f5b6d98b161a8bec1d6'
            '4b5f470a64d44efea12d979340eba31225121100158b8c4409e1eca46c1cebd1')

package() {
	install -D ROMVault35.exe chdman.exe -t "$pkgdir/opt/$pkgname/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -D "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
	install -D chdman.sh "$pkgdir/usr/bin/chdman"
	install -Dm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
	install -Dm644 "$pkgname.png" -t "$pkgdir/usr/share/pixmaps/"
	install -Dm644 tmpfiles.d.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}

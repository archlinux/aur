# Maintainer: Michael Thomas <RVOtakuMike at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Oliver Jaksch <arch-aur at com-in dot de>

pkgname=romvault
pkgver=3.6.1
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
	"$pkgname.desktop"
	"$pkgname.png"
	'tmpfiles.d.conf')
sha256sums=('9f2ffb597c4bf8165252bf6b6d6f1698fe75cb0c3bc3250f50977d7716ae3dc0'
            '996bf0d32dc11506ea2635d64474c24399fab25933463f27d70cfa1d50431a16'
            'ba34e38e27f9954e01cd98e02304e1a505c53708621d19b2e4a05eed0dcf2a26'
            'e289bf838cf51eacfcee48bbe468139ea6b4df3fff97ac1618bb7ba0ac9afd7d'
            'd368d14e844f2dd6f5b2d04b31d9a70f0af6f3ec72669f5b6d98b161a8bec1d6'
            '4b5f470a64d44efea12d979340eba31225121100158b8c4409e1eca46c1cebd1')

package() {
	install -D ROMVault36.exe -t "$pkgdir/opt/$pkgname/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -D "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
	install -Dm644 "$pkgname.png" -t "$pkgdir/usr/share/pixmaps/"
	install -Dm644 tmpfiles.d.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}

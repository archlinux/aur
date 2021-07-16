# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Oliver Jaksch <arch-aur at com-in dot de>

pkgname=romvault
pkgver=3.3.0
pkgrel=1
pkgdesc="A tool for managing your ROMs and DATs for emulators"
arch=('i686' 'x86_64')
url="https://www.romvault.com"
license=('custom')
depends=('mono')
install=$pkgname.install
source=("$pkgname-$pkgver.zip::$url/download/ROMVault_V$pkgver.zip"
        'LICENSE'
        "$pkgname.sh"
        'chdman.sh'
        "$pkgname.desktop"
        "$pkgname.png"
        'tmpfiles.d.conf')
sha256sums=('d593c1069e2725810aaea0666b691f3ca546bf88406e2378cdd8983a14349399'
            '996bf0d32dc11506ea2635d64474c24399fab25933463f27d70cfa1d50431a16'
            'fab2a40272370226000afbd5dffb9502a664d1b93896b15583f1f3705250e5f4'
            '7970f3966dee1f9aa7d5b311753dbeaa7a7878e9fa7cb14e6be886900706a41d'
            '5d188d524030b25059db5002df184aed9b21667710876a87f3b7d5a8cb281154'
            'd368d14e844f2dd6f5b2d04b31d9a70f0af6f3ec72669f5b6d98b161a8bec1d6'
            '4b5f470a64d44efea12d979340eba31225121100158b8c4409e1eca46c1cebd1')

package() {
	install -Dm 755 ROMVault3.exe chdman.exe -t "$pkgdir/opt/$pkgname/"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
	install -Dm 755 chdman.sh "$pkgdir/usr/bin/chdman"
	install -Dm 644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
	install -Dm 644 "$pkgname.png" -t "$pkgdir/usr/share/pixmaps/"
	install -Dm 644 tmpfiles.d.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}

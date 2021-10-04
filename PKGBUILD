# Maintainer: Sapphira Armageddos <shadowkyogre@aim.com>
# Maintainer: silverhikari
pkgname=mse-ygo
pkgver=2.1.2
pkgrel=1
pkgdesc="YugiOh template for Magic Set Editor."
arch=(any)
url="https://github.com/silverhikari/magic-set-templates-aur"
license=('freeware')
depends=('magicseteditor' 'svn' 'zstd')
source=("${pkgname}-${pkgver}::svn+https://github.com/silverhikari/magic-set-templates-aur/trunk/mse-ygo/$pkgver/")
sha256sums=('SKIP')

prepare() {
cd "$srcdir/${pkgname}-$pkgver/"
cat mse-ygo.tar.zst* > mse-ygo.tar.zst
tar -I zstd -xvf mse-ygo.tar.zst
}

package() {
	cd "$srcdir/${pkgname}-$pkgver/mse-ygo"
	mkdir -p "$pkgdir/usr/share/magicseteditor/data"
	cp -r ./yugioh* "$pkgdir/usr/share/magicseteditor/data"
}

# vim:set ts=2 sw=2 et:

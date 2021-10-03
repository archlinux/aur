# Maintainer: silverhikari
# Maintainer: Armageddos <shadowkyogre@aim.com>
pkgname=mse-mtg-m15
pkgver=2.1.2
pkgrel=1
pkgdesc="magic set editor: m15 templates for magic the gathering"
arch=(any)
url="https://github.com/silverhikari/magic-set-templates-aur"
license=('freeware')
depends=('zstd' 'svn' 'mse-mtg')
source=("${pkgname}-${pkgver}::svn+https://github.com/silverhikari/magic-set-templates-aur/trunk/mse-mtg-m15/$pkgver/")
noextract=('mse-mtg-m15')
md5sums=('SKIP')

prepare() {
cd "$srcdir/${pkgname}-$pkgver"
cat mtg-m15.tar.zst* > mtg-m15.tar.zst
tar -I zstd -xvf mtg-m15.tar.zst
}

package() {
cd "$srcdir/${pkgname}-$pkgver/mtg-m15/"
mkdir -p "$pkgdir/usr/share/magicseteditor/data"
cp -r ./magic-m15*.mse-style "$pkgdir/usr/share/magicseteditor/data"
}

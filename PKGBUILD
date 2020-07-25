# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Maintainer: Ben Westover <kwestover [dot] kw [at] gmail [dot] com>

pkgname=btdex
pkgver=0.2.0
pkgrel=1
pkgdesc='Decentralized exchange system running on the Burst blockchain'
arch=('any')
url='https://github.com/btdex/btdex'
license=(GPL3)
depends=('java-runtime' 'xdg-utils')
conflicts=('btdex-git')
provides=('btdex-git')
source=("https://github.com/$pkgname/$pkgname/releases/download/v$pkgver/$pkgname-all-v$pkgver.jar"
        "https://raw.githubusercontent.com/$pkgname/$pkgname/v$pkgver/dist/$pkgname.sh"
        "https://raw.githubusercontent.com/$pkgname/$pkgname/v$pkgver/src/main/resources/icon.png"
        "https://raw.githubusercontent.com/$pkgname/$pkgname/v$pkgver/dist/$pkgname.desktop"
        "https://raw.githubusercontent.com/$pkgname/$pkgname/v$pkgver/LICENSE")
sha256sums=('f721597eeafd092e7dcc2edf9b3068a16aff6256ab2b16bbf7e99542adb2675a'
            '3c1830a574257a35e4d4e1a242f786b98fb3fa0d3c7db1418d4b69d4df881533'
            'e8cba764ca0cddbb8cf658f80e015b941b4ad732bcb1b8da3078894ad51f397a'
            'fa8e5f6561192d1f2554365a7f49c36ac368ae00413f489c0873a801c11e6219'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
	install -Dm644 $pkgname-all-v$pkgver.jar $pkgdir/opt/$pkgname/$pkgname-all.jar
	install -Dm755 $pkgname.sh $pkgdir/opt/$pkgname/$pkgname.sh
	mkdir -p $pkgdir/usr/bin
	ln -sf /opt/$pkgname/$pkgname.sh $pkgdir/usr/bin/$pkgname

	install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	install -Dm644 icon.png $pkgdir/usr/share/pixmaps/$pkgname.png

	install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# Maintainer: Aaron Liu <aaronliu0130 @gmail.com>
pkgname=font-patcher
pkgver=3.4.0
pkgrel=1
pkgdesc='Official patcher to turn any font into a nerd font by adding many useful glyphs'
arch=('any')
url='https://nerdfonts.com/'
license=('MIT')
depends=('fontforge' 'python')
source=("${pkgname}-${pkgver}.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}/FontPatcher.zip"
	'font-patcher.sh')
sha256sums=('a8f11e511ed7c69e96680858c06b50a643ea7752e26d5cd13dd5e5cc53ab1760'
            '60e69b755022ad4770973587061f89a2de0ac33b102c8175409825175dde80e0')

package() {
	install -Dm755 font-patcher.sh "$pkgdir/usr/bin/font-patcher"
	mkdir -p "$pkgdir/usr/share/font-patcher"
	mv bin "$pkgdir/usr/share/font-patcher/"
	mv src "$pkgdir/usr/share/font-patcher/"
	mv font-patcher "$pkgdir/usr/share/font-patcher/"
}

# Maintainer: Aaron Liu <aaronliu0130 @gmail.com>
pkgname=font-patcher
pkgver=3.3.0
pkgrel=1
pkgdesc='Official patcher to turn any font into a nerd font by adding many useful glyphs'
arch=('any')
url='https://nerdfonts.com/'
license=('MIT')
depends=('fontforge' 'python')
source=("${pkgname}-${pkgver}.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}/FontPatcher.zip"
	'font-patcher.sh')
sha256sums=('ce4284e7d1a8816d29bb3a358e33a44e55804792e7925ed0022ba1b3ab1a9d34'
            '3c2b2c743c6ce715f1b3f66d9b1c6219c48899523e7cf9356a330adaac6e1009')

package() {
	install -Dm755 font-patcher.sh "$pkgdir/usr/bin/font-patcher"
	mkdir -p "$pkgdir/usr/share/font-patcher"
	mv bin "$pkgdir/usr/share/font-patcher/"
	mv src "$pkgdir/usr/share/font-patcher/"
	mv font-patcher "$pkgdir/usr/share/font-patcher/"
}

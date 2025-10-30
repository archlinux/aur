# Maintainer: lekker <bradyhickey at outlookdotcom>

pkgname=nerd-patcher
pkgver=3.4.0
pkgrel=2
pkgdesc="The official patching script for Nerd Fonts"
arch=(any)
url="https://github.com/ryanoasis/nerd-fonts"
license=('MIT')
depends=('fontforge' 'python' 'argparse')
conflicts=('font-patcher')
source=("${pkgname}-${pkgver}.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}/FontPatcher.zip"
'nerd-patcher.sh')
sha256sums=('a8f11e511ed7c69e96680858c06b50a643ea7752e26d5cd13dd5e5cc53ab1760'
            'd803b6bc83e3e3106570933046f8cac791a433104ca54b736211959fe8fa7089')

package() {
    install -Dm755 nerd-patcher.sh "$pkgdir/usr/bin/nerd-patcher"
    mkdir -p "$pkgdir/usr/share/nerd-patcher"
    mv * "$pkgdir/usr/share/nerd-patcher/"
    rm "$pkgdir/usr/share/nerd-patcher/nerd-patcher.sh"
    rm "$pkgdir/usr/share/nerd-patcher/nerd-patcher-$pkgver.zip"
    rm "$srcdir/../nerd-patcher-3.4.0.zip"
}
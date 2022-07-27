# Maintainer: Felicia Wen <i@feli.cf>
pkgname=dmenu_shot-git
pkgver=1
pkgrel=2
pkgdesc="A clean and easy-to-use dmenu menu to do some basic image manupulation using ImageMagic on the output of Flameshot."
arch=('any')
url="https://codeberg.org/mehrad/dmenu_shot"
makedepends=('git' 'make')
depends=( 'sh' 'bash' 'xclip' 'flameshot' 'dmenu' 'imagemagick' 'xdotool')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')
check() {
    cd "${pkgname}"
    make check
}
package() {
    cd "${pkgname}"
    make DESTDIR="$pkgdir/" install
}

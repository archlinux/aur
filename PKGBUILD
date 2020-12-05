# Maintainer: Marko Korhonen <aur@marko.korhonen.cc>

pkgname=rofi-pass-ydotool-git
_pkgname=rofi-pass
pkgver=528.87d8bbc
pkgrel=1
pkgdesc="bash script to handle pass storages in a convenient way. Ydotool branch, which works under Wayland"
arch=('any')
url='https://github.com/carnager/rofi-pass/tree/ydotool'
license=('GPL')
depends=('xdg-utils' 'rofi' 'gawk' 'pass' 'ydotool' 'xclip' 'pwgen')
optdepends=('passed-git: change fieldnames in password files')
provides=('rofi-pass')
conflicts=('rofi-pass')

install=rofi-pass.install
makedepends=('git')
source=('git+https://github.com/carnager/rofi-pass#branch=ydotool')

pkgver() {
	cd ${_pkgname}
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd ${_pkgname}
    make DESTDIR="$pkgdir/" \
       PREFIX='/usr' \
       install
}
md5sums=('SKIP')

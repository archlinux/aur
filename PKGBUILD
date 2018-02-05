# Maintainer: Kevin Diehl <contact@kevin-diehl.de> 
_pkgname=i3lock-fancier
pkgname=$_pkgname-git
pkgver=84aa35006f1cab8eb15f992c1b68dd41cbaab99b
pkgrel=3
pkgdesc="i3lock fork that adds keyboard layout indicator"
arch=(i686 x86_64)
url="https://github.com/SuperPrower/i3lock-fancier.git"
license=('GPL')
depends=('cairo' 'libev' 'libx11' 'pam' 'xcb-util-image' 'xcb-util-keysyms' 'libxkbcommon-x11')
conflicts=('i3lock')
provides=('i3lock')
makedepends=('make')
install=$_pkgname.install
source=('git://github.com/SuperPrower/i3lock-fancier.git')
sha256sums=('SKIP')

build() {
    cd "$srcdir/$_pkgname"

    make 
}

package() {
    cd "$srcdir/$_pkgname"

    make DESTDIR="$pkgdir" install

    install -m 0755 -d "$pkgdir/usr/share/i3lock-fancier"
    install -m 0644 "test_config.ini" "$pkgdir/usr/share/i3lock-fancier/default.ini"
}

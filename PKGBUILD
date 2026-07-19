# Maintainer: Olivier Melcher <olivier.melcher@gmail.com>

pkgname=omarchy-world-clock-bin
_pkgname=omarchy-world-clock
_target=x86_64-unknown-linux-gnu
pkgver=0.2.0
pkgrel=1
pkgdesc="World clock widget for Omarchy"
arch=('x86_64')
url="https://github.com/olivoil/omarchy-world-clock"
license=('MIT')
depends=('cairo' 'glib2' 'glibc' 'graphene' 'gtk4' 'gtk4-layer-shell' 'libgcc')
optdepends=('quickshell: Omarchy 4 status bar integration'
            'waybar: Omarchy 3 status bar integration'
            'hyprland: target compositor for Omarchy sessions')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip' '!debug')
install="$pkgname.install"
source_x86_64=(
  "${_pkgname}-${pkgver}-x86_64.tar.gz::$url/releases/download/v${pkgver}/${_pkgname}-${_target}.tar.gz"
)
sha256sums_x86_64=('8920a0ec6236d94e429e18bdf809b372c1201c8f6e065704656018186bdf3beb')

package() {
  install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

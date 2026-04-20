# Maintainer: Olivier Melcher <olivier.melcher@gmail.com>

pkgname=omarchy-world-clock-bin
_pkgname=omarchy-world-clock
_target=x86_64-unknown-linux-gnu
pkgver=0.1.1
pkgrel=1
pkgdesc="Waybar world clock for Omarchy"
arch=('x86_64')
url="https://github.com/olivoil/omarchy-world-clock"
license=('MIT')
depends=('cairo' 'glib2' 'glibc' 'graphene' 'gtk4' 'gtk4-layer-shell' 'libgcc')
optdepends=('waybar: status bar integration'
            'hyprland: target compositor for Omarchy sessions')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip' '!debug')
install="$pkgname.install"
source_x86_64=(
  "${_pkgname}-${pkgver}-x86_64.tar.gz::$url/releases/download/v${pkgver}/${_pkgname}-${_target}.tar.gz"
)
sha256sums_x86_64=('d8bc1aa7798bfe697b26c84dd840bf97f8336c9967877bc4b3a6aef87364f0f6')

package() {
  install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

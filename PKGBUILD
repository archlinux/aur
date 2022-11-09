# Maintainer: noobping <hello@noobping.dev>

pkgname=wofi-pass
pkgver=VERSION
pkgrel=1
pkgdesc="A Wayland-native interface for conveniently using pass"
arch=('any')
url='https://github.com/TinfoilSubmarine/wofi-pass'
license=('GPL')
depends=('coreutils' 'findutils' 'grep' 'man-pages' 'pass' 'tcl' 'util-linux' 'wl-clipboard' 'wofi')
optdepends=(
    'wtype: type support'
    'pass-otp: OTP support')
source=(https://raw.githubusercontent.com/TinfoilSubmarine/wofi-pass/master/wofi-pass)
sha512sums=('a7a18053772e5c675380562a7d77fb56cd20481aa817b86e762a8fef292df24f7c4169f34f6a53b6997a39db460f56be9120b3eeedf58ef4edd7d3957abc00ee')

pkgver() {
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    mkdir -p "$pkgdir"/usr/bin
    install -m755 wofi-pass "$pkgdir"/usr/bin/wofi-pass
}

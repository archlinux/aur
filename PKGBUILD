# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>
pkgname=i3-layout-manager-git
pkgver=r35.695ccf3
pkgrel=3
pkgdesc="Saving, loading and managing layouts for i3wm"
arch=('any')
depends=('i3-wm' 'jq' 'rofi' 'xdotool' 'xorg-xrandr' 'vim' 'perl-anyevent-i3')
url="https://github.com/klaxalk/i3-layout-manager"
license=('GPL')
makedepends=('git')
provides=('i3-layout-manager')
conflicts=('i3-layout-manager')
source=("git+https://github.com/klaxalk/i3-layout-manager.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/i3-layout-manager"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/i3-layout-manager"
  install -D -m0755 ${srcdir}/i3-layout-manager/layout_manager.sh ${pkgdir}/usr/bin/i3-layout-manager
}

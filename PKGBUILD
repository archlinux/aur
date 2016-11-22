# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=gnome-shell-extension-pixel-saver-git
_gitname=pixel-saver
pkgver=1.10.r5.gfba8315
pkgrel=1
pkgdesc="Saves pixels by fusing activity bar and title bar in a natural way"
arch=('any')
url="https://github.com/deadalnix/pixel-saver"
license=('MIT')
depends=('gnome-shell' 'xorg-xprop')
makedepends=('git')
provides=('gnome-shell-extension-pixel-saver')
conflicts=('gnome-shell-extension-pixel-saver')
install=${pkgname}.install
source=('git://github.com/deadalnix/pixel-saver.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_gitname}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/${_gitname}"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname%-*}"
  install -d "${pkgdir}/usr/share/gnome-shell/extensions"
  cp -af "pixel-saver@deadalnix.me" "${pkgdir}/usr/share/gnome-shell/extensions/"
}

# vim:set ts=2 sw=2 et:

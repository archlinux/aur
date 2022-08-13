# Maintainer: Ace Breakpoint <chemistudio@gmail.com>

pkgname=gnome-shell-extension-ibus-tweaker-git
commit=b4cf4e9
pkgver=20220806+${commit}
pkgrel=1
pkgdesc="Tweaker of ibus in gnome-shell for orientation, theme, font and input mode auto-switch."
arch=('any')
url="https://github.com/tuberry/ibus-tweaker"
license=('GPL3')
depends=('gnome-shell>=42.0')
makedepends=('git' 'gettext' 'glib2')
conflicts=('gnome-shell-extension-ibus-tweaker')
provides=('gnome-shell-extension-ibus-tweaker')
groups=('gnome-shell-extensions')
source=("git+https://github.com/tuberry/ibus-tweaker.git")
sha256sums=('SKIP')

build() {
    cd "ibus-tweaker"
    git reset --hard ${commit}
    make _build
}

package() {
  mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/"
  mv "${srcdir}/ibus-tweaker/_build" "${pkgdir}/usr/share/gnome-shell/extensions/ibus-tweaker@tuberry.github.com"
}

# Maintainer: Sagacious Zu <sredshaw@gmail.com>

pkgname=victory-gtk-theme-git
_gitname=victory-gtk-theme
pkgver=r30.b52e1a2
pkgrel=1
pkgdesc='A flat, minimalistic, and bright gtk theme.'
arch=(any)
url="https://github.com/newhoa/victory-gtk-theme"
license=('GPL3')
depends=('')
makedepends=('git')
#optdepends=('xfdesktop: The XFCE desktop'
 #           'openbox: Openbox')
conflicts=('victory-gtk-theme')
provides=('victory-gtk-theme')
source=("git+https://github.com/newhoa/${_gitname}.git")
md5sums=(SKIP)

pkgver() {
  cd "${_gitname}"
  # Use number of revisions as the version itself is too long.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    rm -rf ${_gitname}/{.git*,AUTHORS,CONTRIBUTORS,COPYING,README.md,themes/victory/theme-theme.cache}
    install -dm 755 "${pkgdir}"/usr/share/themes
    cp -dr --no-preserve='ownership' victory-gtk-theme "${pkgdir}"/usr/share/themes/victory
}
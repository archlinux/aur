# Maintainer: Tony Fettes <feihaoxiang2014@gmail.com>

pkgname=mondrian-gtk-theme-git
_gitname=Mondrian
pkgver=r32.2450232
pkgrel=1
pkgdesc="GTK themes based on Piet Mondrian's paintings."
arch=('any')
url='https://www.opencode.net/ju1464/Mondrian'
license=('GPL3')
optdepends=('mondrian-icon-theme-git: for matched icon theme'
            'gtk-engine-murrine' 'gtk-engines')
makedepends=('git')
provides=('mondrian-gtk-theme')
conflicts=('mondrian-gtk-theme')
source=("git+${url}.git")
options=('!strip')
sha256sums=('SKIP')

pkgver() {
  cd ${_gitname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${srcdir}/${_gitname}
  install -dm755 "${pkgdir}/usr/share/themes"
  cp -r GTK-Gnome/* "${pkgdir}/usr/share/themes"
}

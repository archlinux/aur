# Maintainer: Michal Donát <michal at donat dot cz>
pkgname=gnome-shell-extension-calc-git
_pkgname=gnome-shell-calculator
pkgver=r10.26c8c65
pkgrel=1
pkgdesc="Simple gnome shell calculator in run dialog that you can use with alt+f2"
arch=('any')
url="https://github.com/danigm/gnome-shell-calculator"
license=('GPL2')
depends=('gnome-shell')
makedepends=('git')
install='gschemas.install'
source=("git+https://github.com/danigm/gnome-shell-calculator")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"

  for i in $(find -type f); do
    install -Dm 644 "$i" "${pkgdir}/usr/share/gnome-shell/extensions/calc@danigm.wadobo.com/${i}"
  done
}

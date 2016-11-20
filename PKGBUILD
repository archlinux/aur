# Maintainer: Michal Donát <michal at donat dot cz>
pkgname=gnome-shell-extension-autohide-battery-git
_pkgname=autohide-battery
pkgver=r33.8cc4bb1
pkgrel=1
pkgdesc="GNOME Shell extension to hide battery icon, if battery is fully charged and AC is connected"
arch=('any')
url="https://github.com/ai/autohide-battery.git"
license=('MIT')
depends=('gnome-shell')
makedepends=('git')
install='gschemas.install'
source=("git+https://github.com/ai/autohide-battery.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}/autohide-battery@sitnik.ru"

  for i in $(find -type f); do
    install -Dm 644 "$i" "${pkgdir}/usr/share/gnome-shell/extensions/autohide-battery@sitnik.ru/${i}"
  done
}

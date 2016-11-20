# Maintainer: Michal Donát <michal at donat dot cz>
pkgname=gnome-shell-extension-transparent-osd-git
_pkgname=gsext-transparent-osd
pkgver=r4.45f2400
pkgrel=1
pkgdesc="Gnome shell extension to add transparency to the OSD"
arch=('any')
url="https://github.com/ipaq3870/gsext-transparent-osd"
license=('GPL2')
depends=('gnome-shell')
makedepends=('git')
install='gschemas.install'
source=("git+https://github.com/ipaq3870/gsext-transparent-osd")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}/transparentosd@ipaq3870"

  for i in $(find -type f); do
    install -Dm 644 "$i" "${pkgdir}/usr/share/gnome-shell/extensions/transparentosd@ipaq3870/${i}"
  done
}

# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname="adwaita-dark-gtk2-git"
_pkgname="Adwaita-dark-gtk2"
pkgver="r16.dc00e7d"
pkgrel="1"
pkgdesc="Clone of Gnome3 Adwaita dark theme for GTK2."
url="https://github.com/nickurak/Adwaita-dark-gtk2"
license=('GPL')
arch=('any')
makedepends=('git')
depends=('gnome-themes-standard')
provides=("${_pkgname,,}")
conflicts=("${_pkgname,,}")
changelog="ChangeLog"
install="theme.install"
source=("${_pkgname}::git+https://github.com/axxapy/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

package() {
    cd "${srcdir}/"

    install -d -m 755 "${pkgdir}/usr/share/themes/"
    cp -r "${_pkgname}" "${pkgdir}/usr/share/themes/"
    rm -r "${pkgdir}/usr/share/themes/${_pkgname}/.git"
}

# vim:set ts=4 sw=4 et:

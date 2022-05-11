# Maintainer Jocelyn Thode <jocelyn.thode@gmail.com>
pkgname=spicetify-theme-dracula-git
_pkgname=Dracula-Spicetify
pkgver=r19.g97bf149
pkgrel=1
pkgdesc="Dracula theme for Spotify through spicetify-cli"
arch=('any')
url="https://github.com/Darkempire78/Dracula-Spicetify"
license=('custom')
depends=(spicetify-cli)
source=("git+https://github.com/Darkempire78/Dracula-Spicetify.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p "${pkgdir}/usr/share/spicetify-cli/Themes/Dracula"
	cp -r ${srcdir}/${_pkgname}/Dracula/* "${pkgdir}/usr/share/spicetify-cli/Themes/Dracula/"
}


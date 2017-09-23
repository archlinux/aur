# Maintainer: Lucas Saliés Brum <lucas@archlinux.com.br>

pkgname='cinnamon-applet-desktop-capture-git'
pkgver=r99.d9eb339
pkgrel=1
pkgdesc='A comprehensive screenshot and screencasting applet for Cinnamon.'
arch=('any')
url='https://github.com/rjanja/desktop-capture'
license=('GPL')
depends=('cinnamon')
makedepends=('git')
provides=('cinnamon-applet-desktop-capture')
conflicts=('cinnamon-applet-desktop-capture')
source=("${pkgname}::git+https://github.com/rjanja/desktop-capture")
md5sums=(SKIP)
_appletname='capture@rjanja'
_appletdir="usr/share/cinnamon/applets/${_appletname}"

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname}"
  install -dm0755 "${pkgdir}/${_appletdir}"
  find "${_appletname}" -maxdepth 1 -type f -exec install -m0644 '{}' "${pkgdir}/${_appletdir}" \;
}

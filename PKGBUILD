# Maintainer: Michael J. Pento <mjpento@verizon.net> 

pkgname='cinnamon-applet-desktop-capture-git'
pkgver=2.0.0.r135.d404b6e
_pkgver=5.6
pkgrel=1
pkgdesc='A comprehensive screenshot and screencasting applet for Cinnamon.'
arch=('any')
url='https://github.com/ahmedmoselhi/desktop-capture'
license=('GPL')
depends=('cinnamon' 'shutter' 'kazam')
makedepends=('git')
provides=('cinnamon-applet-desktop-capture')
conflicts=('cinnamon-applet-desktop-capture')
source=("${pkgname}::git+https://github.com/ahmedmoselhi/desktop-capture")
md5sums=(SKIP)
_appletname='capture@rjanja'
_appletdir="usr/share/cinnamon/applets/${_appletname}"

pkgver() {
  cd "${pkgname}"
  printf "2.0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname}"
  install -dm0755 "${pkgdir}/${_appletdir}"
  find "${_appletname}" -maxdepth 1 -type f -exec install -m0644 '{}' "${pkgdir}/${_appletdir}" \;
  find "${_appletname}/${_pkgver}" -maxdepth 1 -type f -exec install -m0644 '{}' "${pkgdir}/${_appletdir}" \;
}

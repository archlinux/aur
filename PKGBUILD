# Maintainer: wyf9661 <wyf9661@hotmail.com>
# Contributor: ailtonbsj <ailton.ifce@gmail.com>

_pkgname=wps-office-fonts
pkgname=${_pkgname}-git
pkgver=r1.7519a1
pkgrel=1
pkgdesc="WINGDINGs fonts and MT Extra serials required by wps-office."
arch=(any)
license=("MIT")
url="https://github.com/winunix/wps-office-fonts"
source=(git+${url}.git)
sha1sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=6 HEAD)"
}

package() {
  install -d "${pkgdir}/usr/share/fonts/wps-fonts"
  install -m644 ${srcdir}/${_pkgname}/deb_package/usr/share/fonts/wps-fonts/*.ttf "${pkgdir}/usr/share/fonts/wps-fonts/"
}

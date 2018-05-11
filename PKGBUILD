# Maintainer: Raphael Scholer <rascholer@gmail.com>
# Contributor: mortzprk <mortz.prk@gmail.com>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: flan_suse <windows2linux@zoho.com>
# Contributor: auscompgeek <auscompgeek@zoho.com>

_pkgname="elementary-xfce"
pkgname="${_pkgname}-icons"
pkgver=0.12
pkgrel=1
pkgdesc='Elementary icon theme with improved XFCE support'
arch=('any')
url="https://github.com/shimmerproject/${_pkgname}"
license=('GPL2')
depends=('adwaita-icon-theme')
conflicts=("${pkgname}-git")
options=(!strip)
source=("${url}/archive/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('928f8e0e76357b94295e0a628b49a19a52bc00641bb06f7504cc68b8bc4d7452')

package() {
  cd "${_pkgname}-${_pkgname}-${pkgver}"

  install -m 755 -d "${pkgdir}/usr/share/icons"
  cp -r ${_pkgname}{,-dark{,er,est}} "${pkgdir}/usr/share/icons"

  # Remove unneeded files
  cd "${pkgdir}/usr/share/icons"
  rm ${_pkgname}{,-dark{,er,est}}/{AUTHORS,CONTRIBUTORS,LICENSE}
}
# vim:set ts=2 sw=2 et:

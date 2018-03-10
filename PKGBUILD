# Maintainer: Raphael Scholer <rascholer@gmail.com>
# Contributor: mortzprk <mortz.prk@gmail.com>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: flan_suse <windows2linux@zoho.com>
# Contributor: auscompgeek <auscompgeek@zoho.com>

_pkgname="elementary-xfce"
pkgname="${_pkgname}-icons"
pkgver=0.10
pkgrel=1
pkgdesc='Elementary icon theme with improved XFCE support'
arch=('any')
url="https://github.com/shimmerproject/${_pkgname}"
license=('GPL2')
depends=('adwaita-icon-theme')
conflicts=("${pkgname}-git")
options=(!strip)
source=("${url}/archive/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('0526480846cfa20d2232e0ba2e4f2b5a68a4a5dc9f5691ab2ca623a2615d937b')

package() {
  cd "${_pkgname}-${_pkgname}-${pkgver}"

  install -m 755 -d "${pkgdir}/usr/share/icons"
  cp -r ${_pkgname}{,-dark{,er,est}} "${pkgdir}/usr/share/icons"

  # Remove unneeded files
  cd "${pkgdir}/usr/share/icons"
  rm ${_pkgname}{,-dark{,er,est}}/{AUTHORS,CONTRIBUTORS,LICENSE}
}
# vim:set ts=2 sw=2 et:

# Maintainer: dreieck

_pkgname="wxgtk2-wxgtk-provides"
pkgname="${_pkgname}-latest"
pkgver=3.0.5.1
pkgrel=1
pkgdesc="Dummy/ meta package that depends on 'wxgtk2' and provides 'wxgtk'. Needed for some (ill-formed) AUR packages to fulfill dependencies."
arch=("any")
license=('custom: public domain')
depends=("wxgtk2")
provides=(
  "${_pkgname}=${pkgver}"
  "wxgtk=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)

source=(
  'license-metapackage-pd.txt'
)
sha256sums=(
  '1e86f8ac1ad7315c76f4db8bf6a1dbdde6825ac95ff468e431bbe452b6865ae6'
)

pkgver() {
  pacman -Q wxgtk2 | cut -d ' ' -f 2 | sed -E 's|-.*||'
}

package() {
  install -D -v -m644 "${srcdir}/license-metapackage-pd.txt" "${pkgdir}/usr/share/licenses/${pkgname}/copying.public-domain.txt"
}

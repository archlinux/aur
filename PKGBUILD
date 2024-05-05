# Maintainer: dreieck

_depends="android-sdk-build-tools"
_provides="zipalign"
_pkgname="${_depends}-${_provides}-provides"
pkgname="${_pkgname}"
pkgver=r34.0.0
pkgrel=2
pkgdesc="Dummy/ meta package that satisfies '${_provides}' dependency by '${_depends}'."
url="https://aur.archlinux.org/packages/${_depends}"
arch=("any")
license=('LicenseRef-Custom: public domain')
depends=(
  "${_depends}"
)
provides=(
  "${_provides}=${pkgver}"
)
conflicts=()
source=(
  'license-metapackage-pd.txt'
)
sha256sums=(
  '1e86f8ac1ad7315c76f4db8bf6a1dbdde6825ac95ff468e431bbe452b6865ae6'
)

pkgver() {
  pacman -Q "${_depends}" | cut -d ' ' -f 2 | sed -E 's|-.*||'
}

package() {
  install -D -v -m644 "${srcdir}/license-metapackage-pd.txt" "${pkgdir}/usr/share/licenses/${pkgname}/copying.public-domain.txt"
}

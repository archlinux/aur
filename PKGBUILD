# Maintainer: dreieck

_pkgname="abeep-beep-provides"
pkgname="${_pkgname}"
pkgver=1
pkgrel=3
pkgdesc="Dummy/ meta package that symlinks 'abeep' to 'beep' and thus provides a drop-in replacement for 'beep' that uses ALSA instead of the PC speaker."
url="https://aur.archlinux.org/packages/${pkgname}"
arch=("any")
license=('custom: public domain')
depends=(
  "abeep"
)
provides=(
  "beep"
)
conflicts=(
  "beep"
)

source=(
  'license-metapackage-pd.txt'
)
sha256sums=(
  '1e86f8ac1ad7315c76f4db8bf6a1dbdde6825ac95ff468e431bbe452b6865ae6'
)

package() {
  install -d -v -m755 "${pkgdir}/usr/bin"
  cd "${pkgdir}/usr/bin"
  ln -sv "abeep" "beep"
  install -D -v -m644 "${srcdir}/license-metapackage-pd.txt" "${pkgdir}/usr/share/licenses/${pkgname}/copying.public-domain.txt"
}

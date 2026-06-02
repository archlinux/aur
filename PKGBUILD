# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname=protonmail-getpgpkey
pkgname="${_pkgname}"
pkgver=0.1_20260602.01
pkgrel=1
arch=(
  'any'
)
license=(
  'GPL-3.0-only'
)
pkgdesc=''
groups=(
  'protonmail'
)
url="https://aur.archlinux.org/packages/${pkgname}"
depends=(
  'sh'
  'curl'
)
optdepends=()
makedepends=()
checkdepends=()
conflicts=()
provides=()
replaces=()
source=(
  "protonmail-getpgpkey"
)
sha256sums=(
  '8450017cdb856eb7134fc1899a31599683e7e314fd5ed5652322fa58e425cd74'  # protonmail-getpgpkey
)
validpgpkeys=()

pkgver() {
  "${srcdir}"/protonmail-getpgpkey --version
}

package() {
  cd "${srcdir}"

  install -Dvm755 -t "${pkgdir}"/usr/bin "${srcdir}"/protonmail-getpgpkey

  install -dvm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  cd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -sv ../spdx/GPL-3.0-only.txt .
  cd "${srcdir}"
}

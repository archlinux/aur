# Maintainer: dreieck

_pkgname=optipng-parallel
pkgname="${_pkgname}"
pkgver=0.1
pkgrel=1
pkgdesc="Executes 'optipng' in parallel to the PNG images specified on the command line.."
arch=('any')
depends=(
  'bash'
  'optipng'
  'parallel'
)
makedepends=(
  'coreutils'
)
optdepends=()
provides=()
backup=()
url="https://aur.archlinux.org/packages/optipng-parallel"
license=('GPL-3.0-or-later')
source=(
  "optipng-parallel.sh"
  "GPL3.txt"
)
sha256sums=(
  'e98bc9b4577264a0ce18542be6db8cf162983e9d120c47377632389cd0477c18'
  '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
)


pkgver() {
  cd "${srcdir}"
  ./optipng-parallel.sh --version
}


package() {
  cd "${srcdir}"

  install -Dvm755 "optipng-parallel.sh"  "${pkgdir}/usr/bin/optipng-parallel"
  install -Dvm644 "GPL3.txt"             "${pkgdir}/usr/share/licenses/${pkgname}/GPL3.txt"
}

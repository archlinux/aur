# Maintainer: dreieck

_pkgname=zopflipng-parallel
pkgname="${_pkgname}"
pkgver=0.1
pkgrel=1
pkgdesc="Executes 'zopflipng' in parallel to the PNG images specified on the command line, overwriting the input files."
arch=('any')
depends=(
  'bash'
  'parallel'
  'zopfli'
)
makedepends=(
  'coreutils'
)
optdepends=()
provides=()
backup=()
url="https://aur.archlinux.org/packages/zopflipng-parallel"
license=('GPL-3.0-or-later')
source=(
  "zopflipng-parallel.sh"
  "GPL3.txt"
)
sha256sums=(
  '041dd73954d5cacfbd83464ff336716a931c62637e8d87f3ce028fb17954d58e'
  '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
)


pkgver() {
  cd "${srcdir}"
  ./zopflipng-parallel.sh --version
}


package() {
  cd "${srcdir}"

  install -Dvm755 "zopflipng-parallel.sh"  "${pkgdir}/usr/bin/zopflipng-parallel"
  install -Dvm644 "GPL3.txt"             "${pkgdir}/usr/share/licenses/${pkgname}/GPL3.txt"
}

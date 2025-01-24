# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=hlint-bin
_githubname=hlint
pkgver=3.8
pkgrel=2
pkgdesc='Haskell source code suggestions. Packaged from upstream binary release.'
arch=('x86_64')
url="https://github.com/ndmitchell/hlint"
license=('BSD')
depends=('gmp')
conflicts=('hlint')
provides=('hlint')
source=("${url}/releases/download/v${pkgver}/${_githubname}-${pkgver}-${arch}-linux.tar.gz")

sha256sums=('882363872064c70801858b4e9fa17468531fc30b91ed5b8d260eb48fc90b3e61')


# PKGBUILD functions

package() {
  # Create dest directories
  sharedir="${pkgdir}/usr/share/${_githubname}"
  mkdir -p "$sharedir"
  bindir="${pkgdir}/usr/bin"
  mkdir "$bindir"

  # Copy all source distribution files and move the binary into bin
  cd "${srcdir}/${_githubname}-${pkgver}"
  cp -r ./* "$sharedir"
  mv "${sharedir}/${_githubname}" "$bindir"
}

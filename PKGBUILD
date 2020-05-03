# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=hlint-bin
_githubname=hlint
pkgver=3.0.4
pkgrel=1
pkgdesc='Haskell source code suggestions. Packaged from upstream binary release.'
arch=('x86_64')
url="https://github.com/ndmitchell/hlint"
license=('BSD')
depends=('gmp')
conflicts=('hlint')
source=("${url}/releases/download/v${pkgver}/${_githubname}-${pkgver}-${arch}-linux.tar.gz")

sha256sums=('9630ea16dd12a5d22dae7838984efaecbf4399e44edc70f01df943d0da6f94ac')


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

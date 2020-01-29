# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=hlint-bin
_githubname=hlint
pkgver=2.2.9
pkgrel=1
pkgdesc='Haskell source code suggestions. Packaged from upstream binary release.'
arch=('x86_64')
url="https://github.com/ndmitchell/hlint"
license=('BSD')
depends=('gmp')
conflicts=('hlint')
source=("${url}/releases/download/v${pkgver}/${_githubname}-${pkgver}-${arch}-linux.tar.gz")

sha256sums=('5a1f19598adc51fb8fc5b75fc41dfcc52adeed6ea6081a66c6b8737418d3506e')


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

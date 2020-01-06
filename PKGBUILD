# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=hlint-bin
_githubname=hlint
pkgver=2.2.8
pkgrel=1
pkgdesc='Haskell source code suggestions. Packaged from upstream binary release.'
arch=('x86_64')
url="https://github.com/ndmitchell/hlint"
license=('BSD')
depends=('gmp')
conflicts=('hlint')
source=("${url}/releases/download/v${pkgver}/${_githubname}-${pkgver}-${arch}-linux.tar.gz")

sha256sums=('c53976e0969390a24d115ec77138a9a328ab9d938d538630f30e64affd693424')


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

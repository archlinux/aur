# Maintainer: dreieck

_pkgname='jojodiff'
pkgname="${_pkgname}-bin"
pkgver=0.8.1
pkgrel=1
pkgdesc="A tool to create and to apply binary patches."
url='http://jojodiff.sourceforge.net/'
arch=('i686' 'x86_64')
license=(GPL3)

depends=(
)

depends_x86_64=(
  "lib32-gcc-libs"
)

makedepends=(
)

optdepends=(
)

provides=(
  "${_pkgname}=${pkgver}"
)

replaces=(
)

conflicts=(
  "${_pkgname}"
)


_giturl="https://github.com/jjwhitney/BDelta.git"

source=(
  "jdiff081.tgz::https://sourceforge.net/projects/jojodiff/files/jojodiff/jojodiff08/jdiff081.tgz/download"
)

sha256sums=(
  "8681e503c1d9658a89788d7e4c34c08adce5a0114610cfaaefa32f2bbe613058"
)


package() {
  _unpackeddir="${srcdir}/jdiff081"
  cd "${_unpackeddir}"
  
  install -d -m755 "${pkgdir}/usr/bin"
  install -Dm755 "${_unpackeddir}/linux"/{jdiff,jptch} "${pkgdir}/usr/bin/"
  
  install -d -m755 "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dm644 "${_unpackeddir}"/readme.{htm,txt} "${pkgdir}/usr/share/doc/${_pkgname}/"
}

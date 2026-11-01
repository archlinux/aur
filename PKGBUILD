# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: libele <libele@disroot.org>

_binpkg=zilf
pkgname="${_binpkg}-bin"
_rlver=0.11.1
pkgver=0.11.1
pkgrel=1
pkgdesc="A set of tools for working with the ZIL interactive fiction language, including a compiler, assembler, disassembler, and game library."
arch=('x86_64')
url="https://foss.heptapod.net/${_binpkg}/${_binpkg}"
license=('GPL-3.0-or-later')
depends=('glibc')
provides=("${_binpkg}")
conflicts=("${_binpkg}")
options=('!strip')

source=("https://storage.googleapis.com/${_binpkg}-releases/${_rlver}/packages/${_binpkg}-${pkgver}-linux-x64.tar.gz")
sha256sums=('a3628b2d465b770f7fc67702ab60a200126a33d51dafacd954e1f13323ece9d2')

package() {
  cd "${srcdir}/${_binpkg}-${pkgver}"-linux-x64

  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/lib/${_binpkg}"
  install -dm755 "${pkgdir}/usr/share/${_binpkg}"

  install -Dm755 bin/* "${pkgdir}/usr/lib/${_binpkg}"

  cp -a zillib "${pkgdir}/usr/lib/${_binpkg}"
  cp -a sample "${pkgdir}/usr/share/${_binpkg}"

  ln -sf /usr/lib/"${_binpkg}"/zilf "${pkgdir}"/usr/bin/zilf
  ln -sf /usr/lib/"${_binpkg}"/zapf "${pkgdir}"/usr/bin/zapf
}


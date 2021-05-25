# Contributor: taotieren <admin@taotieren.com>

pkgname=hex2bin-bin
_pkgname=hex2bin
pkgver=2.5
pkgrel=1
pkgdesc="Converts Motorola and Intel hex files to binary."
arch=('x86_64' 'aarch64')
url="http://hex2bin.sourceforge.net/"
license=('GPL')
depends=("glibc")
optdepends=()
makedepends=()
conflicts=("hex2bin")
source=("https://sourceforge.net/projects/${_pkgname}/files/${_pkgname}/Hex2bin-${pkgver}.tar.bz2")
sha256sums=('22afd5a63225e3f20401588f6796757dc62cc1c8ca5dc268f7e46a6c0405949d')

# build() {
#   cd "Hex2bin-${pkgver}"
#   make clean
#   make
# }

package() {
  cd "Hex2bin-${pkgver}"

  install -dm 755 "${pkgdir}/usr/share/doc"

  install -Dm 755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm 755 mot2bin "${pkgdir}/usr/bin/mot2bin"
  install -Dm 644 "${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"

  cp -a doc/ "${pkgdir}/usr/share/doc/${_pkgname}/"
}

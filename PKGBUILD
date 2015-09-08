# Maintainer: David Manouchehri <manouchehri@riseup.net>

pkgname='pic32prog'
_gitname="${pkgname}"
_gitbranch='master'
_gitauthor='sergev'
pkgver=2.0.147
pkgrel=1
pkgdesc="Flash programming utility for Microchip PIC32 microcontrollers"
url="https://github.com/${_gitauthor}/${_gitname}"
license=('GPL')
source_x86_64=("https://github.com/${_gitauthor}/${_gitname}/raw/master/linux64/${pkgname}")
source_i686=("https://github.com/${_gitauthor}/${_gitname}/raw/master/linux32/${pkgname}")
sha512sums_x86_64=('1804f21388b20e92d04830d12a76b5ce9413202ba067c08b4d902e761f22754ae3bf5ab6ffc45483f6f13334a58d2e4f9b28229e0b66523c84986f0c17155f27')
sha512sums_i686=('')
arch=('x86_64') # arch=('i686' 'x86_64')
depends=('libusb' 'libusb-compat')
# makedepends=('git')
optdepends=('ejtagproxy-git: GDB for PIC32'
            'microchip-mplabxc32-bin: C/C++ compiler for PIC32')
conflicts=("${pkgname}-git" "${pkgname}-svn")
provides=("${pkgname}-git" "${pkgname}-svn")

pkgver() {
  cd "${srcdir}/"
  chmod +x pic32prog
  ./pic32prog -V | awk 'END {print $NF}'
}

package() {
  cd "${srcdir}/"
  mkdir -p "${pkgdir}/usr/local/bin/"
  cp "${srcdir}/pic32prog" "${pkgdir}/usr/local/bin/"
}

# vim:set et sw=2 sts=2 tw=80:
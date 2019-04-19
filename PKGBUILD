# Maintainer: David Manouchehri <manouchehri@riseup.net>

pkgname='pic32prog'
_gitname="${pkgname}"
_gitbranch='master'
_gitauthor='sergev'
pkgver=2.0.204
pkgrel=1
pkgdesc="Flash programming utility for Microchip PIC32 microcontrollers"
url="https://github.com/${_gitauthor}/${_gitname}"
license=('GPL')
source_x86_64=("https://github.com/${_gitauthor}/${_gitname}/raw/e5258f410c2757d6e4952cecc825d63a3c22adb6/linux64/${pkgname}")
sha512sums_x86_64=('b8d9a775cd61ed9cea8e079a8f0d0ae58dacde93a380895c2024bcc79bec19688a67678fefde1d2f538baaf261ae85c9c7d805b84c70facf9e003602866b9a15')
arch=('x86_64')
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
  mkdir -p "${pkgdir}/usr/bin/"
  cp "${srcdir}/pic32prog" "${pkgdir}/usr/bin/"
}

# vim:set et sw=2 sts=2 tw=80:

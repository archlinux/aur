# Maintainer: fullarnoldostupi
pkgname=steghide-bin
pkgver=0.5.1
pkgrel=1
_debrel=15
pkgdesc="A steganography program (binary version from Debian)"
arch=('x86_64')
url="http://steghide.sourceforge.net"
license=('GPL-2.0-only')
depends=('libjpeg6-turbo-bin' 'libmcrypt' 'mhash' 'zlib' 'gcc-libs')
provides=('steghide')
conflicts=('steghide')

source=("https://deb.debian.org/debian/pool/main/s/steghide/steghide_${pkgver}-${_debrel}_amd64.deb")
sha256sums=('ae33e98a3a90e3ff968c4d0fe76627aeb8d5e9f0b6d48947c065fb1ebdb7db24')

package() {
  bsdtar -xf "${srcdir}"/data.tar.* -C "${pkgdir}/"

  install -Dm644 "${pkgdir}/usr/share/doc/steghide/copyright" \
    "${pkgdir}/usr/share/licenses/${pkgname}/copyright"

  # Remove Debian-specific files
  rm -rf "${pkgdir}/usr/share/doc"
  rm -rf "${pkgdir}/usr/share/lintian"
}


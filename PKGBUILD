# Maintainer: David Manouchehri <manouchehri@riseup.net>

pkgname="visual"
pkgver=1.27
_pkgver="${pkgver//.}"
pkgrel=2
pkgdesc="A highly visual ARM emulator, designed to make learning ARM Assembly language easier."
url="http://salmanarif.bitbucket.org/visual/"
license=('unknown')
source_x86_64=("http://bit.ly/visuallinux_${_pkgver}_amd64")
source_i686=("http://bit.ly/visuallinux_${_pkgver}_i386")
sha512sums_x86_64=('ef86dcac1c3a4ff0b8931d76a74731530badea4c3f0317b2000ecfc8045258042fec1bf8b25d66d8e30a1666b6d11ba70ac04980843c51aa14ff47193b255ce2')
sha512sums_i686=('4b46d0d9eed27c0d71f8171f6cb6e732d3ccd72c8427d184a0d725335abc19234b836ee10e4e807ec666d56a4c45021ed540f1360a1a99f3e33b5170ac91de39')
arch=('i686' 'x86_64')
depends=('java-runtime' 'java-openjfx')

package() {
  cd "${srcdir}/"
  tar -xvf 'data.tar.xz' -C "${pkgdir}/"

  # Use the system's JRE.
  sed -i 's,../jre/bin/java,java,' "${pkgdir}/usr/local/bin/visual/VisUAL.sh"
  rm -r "${pkgdir}/usr/local/bin/visual/jre/" # Remove the bundled JRE.
}

# vim:set et sw=2 sts=2 tw=80:

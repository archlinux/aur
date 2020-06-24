# Maintainer: Tassos Natsakis <7712382@eipieq.com>
# Packager: Tassos Natsakis <7712382@eipieq.com>

pkgname="sfml2.3"
pkgver="2.3.2"
pkgrel=1
pkgdesc="A cross platform, fast, multimedia library"
url="https://www.sfml-dev.org/"
arch=('x86_64') 
license=("custom")
options=('!strip') # Avoid time consuming operations.
PKGEXT='.tar.gz' 
_dir="SFML-2.3.2"
depends=('freetype2' 'xorg-server' 'xorg-xrandr' 'mesa' 'flac' 'libvorbis' 'openal' 'libpthread-stubs')
source=("https://www.sfml-dev.org/files/SFML-2.3.2-linux-gcc-64-bit.tar.gz")
sha256sums=('eaa87f108e62e1a0b988d187a2ea4138c017fbf7d62d857ddd2de25cd51ebc68')

package() {
  mkdir -p "${pkgdir}/usr/include"
  mkdir -p "${pkgdir}/usr/share/${pkgname}/docs"
  mkdir -p "${pkgdir}/usr/share/${pkgname}/examples"
  mkdir -p "${pkgdir}/usr/share/${pkgname}/cmake"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  mkdir -p "${pkgdir}/usr/include/${pkgname}"
  mkdir -p "${pkgdir}/usr/lib"

  cp "${srcdir}/${_dir}/share/SFML/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  cp -r "${srcdir}/${_dir}/share/SFML/examples" "${pkgdir}/usr/share/${pkgname}/"
  cp -a "${srcdir}/${_dir}/include/SFML/." "${pkgdir}/usr/include/${pkgname}/"
  cp -a "${srcdir}/${_dir}/lib/"*2.3* "${pkgdir}/usr/lib/"
}

# vim:set et sw=2 sts=2:

# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Phillip Smith <pkgbuild@phs.id.au>

pkgname=tile-world
pkgver=2.3.1
pkgrel=1
pkgdesc="Emulation of the game Chip's Challenge"
arch=('x86_64')
url="https://tw2.bitbusters.club/"
license=('GPL-2.0-or-later')
depends=('sdl2')
makedepends=('qt6-base' 'cmake')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/SicklySilverMoon/tworld/archive/refs/tags/v${pkgver}.tar.gz"
  "${pkgname}.desktop"
  "${pkgname}.png"
)
sha256sums=('419db53a2ad8ce14f6a3b9f68518bdd029574dde4aeaabfd6e0e927e00bbf864'
            '1f0774dbc95366ff2d085debfb6b2a16823dfd00eae52013adeed1efae07f254'
            '880355404ab6940e46621d075ba256c547fba2afe7be28b39f8e1694d33f948b')

build() {
  cd "${srcdir}/tworld-${pkgver}"
  #./configure \
  #  --prefix=/usr \
  #  --mandir=/usr/share/man \
  #
  #make
  mkdir build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Relase -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr/" ..
  cmake --build .
}
  
package() {
  cd "${srcdir}/tworld-${pkgver}/build"
  mkdir -p "${pkgdir}/usr"  
  make install
#  install -dm755 "${pkgdir}"/usr/{bin,share/{tworld,man/man6}}
#  install -dm755 "${pkgdir}/usr/share/tworld/"{sets,data,res}
#  install -m755 tworld "${pkgdir}/usr/bin"
#  ln -s "/usr/bin/tworld" "${pkgdir}/usr/bin/${pkgname}"
#  install -m644 sets/*.dac "${pkgdir}/usr/share/tworld/sets"
#  install -m644 data/*.dat "${pkgdir}/usr/share/tworld/data"
#  install -m644 res/{rc,*.bmp,*.txt,*.wav} "${pkgdir}/usr/share/tworld/res"
#  install -m644 docs/tworld.6 "${pkgdir}/usr/share/man/man6"
#	install -DTm644 ${startdir}/${pkgname}.png     "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}.png"
#	install -DTm644 ${startdir}/${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

# vim:set ts=2 sw=2 et:

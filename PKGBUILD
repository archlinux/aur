# Maintainer: Lars Rustand <rustand dot lars at gmail dot com>
# Contributor: Sven Schneider <archlinux.sandmann@googlemail.com>
# Contributor: Jason Melton <jason.melton@gmail.com>

pkgname=stuntrally-bin
pkgver=2.6
pkgrel=1
pkgdesc="A 3D racing game based on VDrift and OGRE with track editor"
arch=('i686' 'x86_64')
license=('GPL3')
url="http://stuntrally.tuxfamily.org"
depends=('ogre' 'sdl2' 'libvorbis' 'enet' 'bullet' 'openal' 'hicolor-icon-theme')
source=("https://netcologne.dl.sourceforge.net/project/stuntrally/${pkgver}/StuntRally-${pkgver}-linux.tar.gz")
sha256sums=('60fd882df354cfcb018127aa3818da284a876adb266d7d7f065314954744c459')

package() {
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -r "${srcdir}/StuntRally-${pkgver}-linux64"/* "${pkgdir}/usr/share/${pkgname}"
  mkdir -p "${pkgdir}/usr/bin"
  ln -sr "${pkgdir}/usr/share/${pkgname}/stuntrally" "${pkgdir}/usr/bin/stuntrally"
  ln -sr "${pkgdir}/usr/share/${pkgname}/sr-editor" "${pkgdir}/usr/bin/sr-editor"
  rm "${pkgdir}/usr/share/${pkgname}/lib/64/libstdc++.so.6"
}

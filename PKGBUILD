# Maintainer: Sandy Carter <genaloner@gmail.com>
# PKGBUILD source: https://github.com/TES3MP/openmw-tes3mp

pkgname=openmw-tes3mp
pkgver=0.6.1
pkgrel=1
pkgdesc="TES3MP is a project aiming to add multiplayer functionality to OpenMW, a free and open source recreation of the popular Bethesda Softworks game \"The Elder Scrolls III: Morrowind\"."
arch=('x86_64')
url="https://github.com/TES3MP/openmw-tes3mp"
license=('GPL3' 'custom')

depends=('openal' 'openscenegraph' 'mygui>=3.2.1' 'bullet' 'qt5-base' 'ffmpeg' 'sdl2' 'unshield' 'libxt')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")

source=('https://github.com/TES3MP/openmw-tes3mp/releases/download/tes3mp-0.6.1/tes3mp-GNU.Linux-x86_64-release-0.6.1-f5e23d5fc6-p5.tar.gz'
        'https://raw.githubusercontent.com/TES3MP/openmw-tes3mp/master/files/tes3mp/tes3mp_logo.png')
sha1sums=('0ec83b563aea0118bb5a82c1e3295627046bd6b4'
          '7a3f41f2c37fa5f5c0daf0e91619b5a461aa8f5a')

package() {
  # install .desktop files
  install -Dm644 tes3mp-client.desktop "$pkgdir/usr/share/applications/tes3mp-client.desktop"
  install -Dm644 tes3mp-server.desktop "$pkgdir/usr/share/applications/tes3mp-server.desktop"
  install -Dm644 tes3mp-browser.desktop "$pkgdir/usr/share/applications/tes3mp-browser.desktop"


  # icon for .desktop files
  install -Dm644 tes3mp_logo.png "$pkgdir/usr/share/pixmaps/tes3mp.png"

  # main
  cd "${srcdir}"
  mv TES3MP $pkgdir/opt/$pkgname
}

# vim:set ts=2 sw=2 et:

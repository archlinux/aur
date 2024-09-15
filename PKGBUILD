# Maintainer: PerilousBooklet <raffaele.orabona@protonmail.com>
# Contributor: Lars Rustand <rustand dot lars at gmail dot com>
# Contributor: Sven Schneider <archlinux.sandmann@googlemail.com>
# Contributor: Jason Melton <jason.melton@gmail.com>

pkgname=stuntrally-bin
_pkgname=stuntrally
pkgver=3.1
pkgrel=1
pkgdesc="A 3D racing game based on VDrift and OGRE with track editor."
arch=('i686' 'x86_64')
license=('GPL3')
url="http://stuntrally.tuxfamily.org"
depends=('ogre' 'sdl2' 'libvorbis' 'enet' 'bullet' 'openal' 'hicolor-icon-theme')
source=("https://github.com/stuntrally/stuntrally3/releases/download/$pkgver/StuntRally-$pkgver-Linux.tgz"
        "stuntrally.desktop"
        "sr-editor.desktop"
        "stuntrally3.sh"
        "sr-editor3.sh")
sha256sums=('5fd2ccb1f5bea4fcf51a7324919b72d3a9bb7611c74309e137b9c75fc1a7d44f'
            'c97393c2ecdaf763125be03e0d19037db9f06bb92aade318c2bf79821b8677f4'
            '5f54cdd7c663f7df884cb3a768e90bb94103d18388622e7835e25d2a529b2a90'
            '7dbc81b9629512de32f444e68f3b39cd774e21fa6f895d0930fd0254d312329b'
            '8f14eccb4ce62e85591997e44ea414682098a93727d79e6bd08024ec4de58c2f')

package() {
  mkdir -vp "$pkgdir/usr/share/$_pkgname"
  cp -vr "$srcdir/StuntRally-$pkgver-Linux" "$pkgdir/usr/share/$_pkgname"
  install -Dm755 "stuntrally.desktop" "$pkgdir/usr/share/applications/stuntrally.desktop"
  install -Dm755 "sr-editor.desktop" "$pkgdir/usr/share/applications/sr-editor.desktop"
  install -Dm755 "stuntrally3.sh" "$pkgdir/usr/bin/stuntrally3"
  install -Dm755 "sr-editor3.sh" "$pkgdir/usr/bin/sr-editor3"
}

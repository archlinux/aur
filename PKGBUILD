pkgname=dustrac
pkgver=1.13.0
pkgrel=1
pkgdesc="Dust Racing 2D is a traditional top-down car racing game including a level editor"
arch=('i686' 'x86_64')
url="http://juzzlin.github.io/DustRacing2D/"
license=('GPL23')
depends=('sdl' 'openal' 'libvorbis' 'qt5-base')
makedepends=('cmake')
source=("https://github.com/juzzlin/DustRacing2D/releases/download/${pkgver}/dustrac-${pkgver}-linux-x86_64-qt5.tar.gz" "dustrac.sh")
sha512sums=('cedd8ae783b92b6332f8dc1d74902797d9b0b7170ee71e171a7a87c38ce2715d7cc725f98f358ccf6d82cb27df1c15821905999e855854b0e8be1a50c52f41b8'
            '8132932cab8e80924803f082c81e2d16f1cf863ad649c0c37ba7dff7aa17383a080b2f6b3dace1b7d0913f5f4da2e25c2bae5df44be29cbf25571380c772df1c')

package() {
  install -d "${pkgdir}/opt"

  cp -r "${srcdir}/dustrac-${pkgver}-linux-x86_64-qt5" "${pkgdir}/opt/dustrac"  

  # Copy desktop launcher.
  install -d "${pkgdir}/usr/bin"
  install -m755 "${srcdir}/dustrac.sh" "${pkgdir}/usr/bin/dustrac-game"
}

# vim: sw=2:ts=2 et:

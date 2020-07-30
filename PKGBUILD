# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=lzdoom-bin
pkgver=3.86a
pkgrel=1
pkgdesc='Fork of GZDoom 3.3.2 for legacy systems'
arch=('i686' 'x86_64')
url='https://www.zdoom.org/downloads'
license=('GPL3')
depends=('sdl2' 'alsa-lib')
optdepends=('fluidsynth' 'libsndfile' 'mpg123' 'openal' 'timidity++')
options=('!strip' '!emptydirs')
source_i686=("${pkgname}-${pkgver}_i686.deb::https://github.com/drfrag666/gzdoom/releases/download/${pkgver}/lzdoom_${pkgver}_i386.deb")
source_x86_64=("${pkgname}-${pkgver}_x86_64.deb::https://github.com/drfrag666/gzdoom/releases/download/${pkgver}/lzdoom_${pkgver}_amd64.deb")
sha256sums_i686=('142fa695b4ad1b2b79f6fdc9e8bcc7161c1015f66bc1c7d3a415de3308493e8d')
sha256sums_x86_64=('b6c1297a1a6355f1dce6f0ea6e915b0aca84d2c923770d9bdbecc225d77a2155')

package() {
  tar xf data.tar.xz -C "${pkgdir}"
  cd "${pkgdir}"
  mkdir usr/bin
  mv usr/games/* usr/bin
  rm -rf usr/games
}
# vim:set ts=2 sw=2 et:
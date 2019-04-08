# From the unofficial fork of Borderlands, Frontieres, by Linux MAO on GITLAB:
# Maintainer: loriant <spaceflorent at aol.com>

_pkgname=Frontieres
pkgname="frontieres-git"
pkgver=0.4.0
pkgrel=1
pkgdesc="An interactive granular sampler forked from the Bordelands Granular project"
arch=('any')
url="https://github.com/linuxmao-org/Frontieres"
license=("GPL")
depends=('qt5-tools' 'glu' 'liblo' 'libsoxr'
         'alsa-lib' 'libglvnd' 'libpulse')
makedepends=('git' 'cmake')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("git+https://github.com/linuxmao-org/Frontieres.git")
md5sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir/" install
}

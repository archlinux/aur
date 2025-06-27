# Maintainer: Zoe Wetzel <aur@commanderred.xyz>
_pkgname=shoreline
pkgname=${_pkgname}-git

pkgver=1.0.0
pkgrel=3
pkgdesc="A very fast (200+ Gbit/s) pixelflut server written in C with full IPv6 support"

arch=('any')
url="https://github.com/TobleMiner/${_pkgname}"
license=('MIT')
depends=(
    'sdl2-compat'
    'libvncserver'
    'numactl'
    'freetype2'
)
makedepends=('git')

source=(
  "git+${url}.git"
)

build() {
  cd "$srcdir/${_pkgname}"

  make
}

package() {
  cd "$srcdir/${_pkgname}"

  install -Dm755 "./shoreline" "${pkgdir}/usr/bin/shoreline"
}

sha256sums=('SKIP')

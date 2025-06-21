# Maintainer: Zoe Wetzel <aur@commanderred.xyz>
_pkgname=sturmflut
pkgname=${_pkgname}-git

pkgver=1.0.1
pkgrel=1
pkgdesc="A FAST (80+ Gbit/s) pixelflut client with full IPv6 and animation support"

arch=('any')
url="https://github.com/TobleMiner/${_pkgname}"
license=('MIT')
depends=('imagemagick')
optdepends=('ffmpeg: video support')
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

  install -Dm755 "./sturmflut" "${pkgdir}/usr/bin/sturmflut"
}

sha256sums=('SKIP')

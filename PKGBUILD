# Maintainer: Mark "maemolol" Korobkin <markkorobkin85@gmail.com>

pkgname=plaincontrolcenter
_pkgname=plainControlCenter
pkgver=0.6.3
pkgrel=1
pkgdesc="plainDE control center"
arch=(x86_64 i686 pentium4 arm armv6h armv7h aarch64)
url="https://plainde.github.io"
license=(GPL3)
depends=(qt5-base noto-fonts-emoji polkit ttf-opensans make plainpanel plainabout)
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/plainDE/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('6db878964333f03925b58d88c34111ae56218fe9819fedbfef34ff4b3f1a789a')
conflicts=('plaincontrolcenter-git')

build() {
  cd "${_pkgname}-${pkgver}"
  
  qmake
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  
  install -Dm 755 "${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
}

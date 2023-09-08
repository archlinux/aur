# Maintainer: Mark "maemolol" Korobkin <markkorobkin85@gmail.com>

pkgname=plainabout
_pkgname=plainAbout
pkgver=0.6.3
pkgrel=1
pkgdesc="plainDE about screen"
arch=(x86_64 i686 pentium4 arm armv6h armv7h aarch64)
url="https://plainde.github.io"
license=(GPL3)
depends=(qt5-base noto-fonts-emoji polkit ttf-opensans make plainbase)

makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/plainDE/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('20d1e20da16fa2d9c4071a1a6488bc8a165c69f0ae769d776b74e221051fb6d2')
conflicts=('plainabout-git')

build() {
  cd "${_pkgname}-${pkgver}"
  
  qmake
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  
  install -Dm 755 "${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
}

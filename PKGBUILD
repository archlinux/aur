# Maintainer: Mark 'maemolol' Korobkin <markkorobkin85@gmail.com>

pkgname=plainpanel
_pkgname=plainPanel
pkgver=0.6.3
pkgrel=3
pkgdesc="plainDE panel"
arch=(x86_64 i686 pentium4 arm armv6h armv7h aarch64)
url="https://plainde.github.io"
license=(GPL3)
depends=(qt5-base noto-fonts-emoji polkit ttf-opensans make alsa-utils kwindowsystem5 python3 picom upower plainbase plainartwork plainabout)
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/plainDE/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ed2d5e7864908611bb78a1da2668c58470a57700b22162801356a5eabaeacfde')
conflicts=('plainpanel-git')

build() {
  cd "${_pkgname}-${pkgver}"
  
  qmake
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  
  install -Dm 755 "${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
}

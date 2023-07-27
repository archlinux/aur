# Maintainer: Mark 'maemolol' Korobkin <markkorobkin85@gmail.com>

pkgname=plainpanel
_pkgname=plainPanel
pkgver=0.6.2
pkgrel=1
pkgdesc="plainDE panel"
arch=(x86_64 i686 pentium4 arm armv6h armv7h aarch64)
url="https://plainde.github.io"
license=(GPL3)
depends=(qt5-base noto-fonts-emoji polkit ttf-opensans make alsa-utils kwindowsystem python3 picom upower plainbase plainartwork plainabout)
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/plainDE/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a1c9d5e1322ba66d5b1713c02085a78b206ec3d82a05b9629e6c75315de487b5')
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

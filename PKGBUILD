# Maintainer: Mark 'maemolol' Korobkin <maemolol@transf.email>

pkgname=plainpanel
_pkgname=plainPanel
pkgver=0.5.2_1
pkgrel=1
pkgdesc="plainDE panel"
arch=(x86_64 i686 pentium4 arm armv6h armv7h aarch64)
url="https://plainde.github.io"
license=(GPL3)
depends=(qt5-base noto-fonts-emoji polkit ttf-opensans make alsa-utils kwindowsystem python3 picom upower plainbase plainartwork plainabout)
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/plainDE/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b0167682069f403614079a039577680537f371154660c810943233ba0d917e12')
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

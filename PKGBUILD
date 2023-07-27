# Maintainer: Ivan 'ivabus' Bushchik ivabus@ivabus.dev -> https://github.com/ivabus

pkgname=plaincontrolcenter
_pkgname=plainControlCenter
pkgver=0.6.2
pkgrel=1
pkgdesc="plainDE control center"
arch=(x86_64 i686 pentium4 arm armv6h armv7h aarch64)
url="https://plainde.github.io"
license=(GPL3)
depends=(qt5-base noto-fonts-emoji polkit ttf-opensans make plainpanel plainabout)
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/plainDE/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a0718f674ff76d21716c5f6064980202b4469603fc25793eff902e0f99ed60fe')
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

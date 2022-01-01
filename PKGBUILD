# Maintainer: robiot <me@robiot.dev>

pkgname=xclicker
pkgver=1.3.1
pkgrel=1
pkgdesc='A blazing fast gui autoclicker for linux'
arch=('x86_64' 'aarch64')
url='https://github.com/robiot/xclicker'
license=('GPL-3.0')
makedepends=('git' 'meson' 'libx11' 'libxi')
sha512sums=('SKIP')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

build() {
  cd $pkgname-$pkgver

  make release
}

package() {
  cd $pkgname-$pkgver

  install -Dm 644 img/icon.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
  install -Dm 755 build/release/src/${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm 755 xclicker.desktop ${pkgdir}/usr/share/applications/xclicker.desktop
}


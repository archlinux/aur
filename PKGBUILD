# Maintainer: robiot <me@robiot.dev>

pkgname=xclicker
pkgver=1.5.0
pkgrel=1
pkgdesc='A blazing fast gui autoclicker for linux'
arch=('x86_64' 'aarch64')
url='https://github.com/robiot/xclicker'
license=('GPL-3.0')
makedepends=('meson' 'libx11' 'libxi' 'libxtst' 'pkgconf', 'gtk3')
sha512sums=('SKIP')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

build() {
  cd $pkgname-$pkgver

  make release
}

package() {
  cd $pkgname-$pkgver

  install -Dm 644 assets/icon.png ${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png
  install -Dm 755 build/release/src/${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm 755 assets/xclicker.desktop ${pkgdir}/usr/share/applications/xclicker.desktop
}

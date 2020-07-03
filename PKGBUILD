# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Alejandro Valdes <alejandrovaldes@live.com>
# Contributor: liberodark

pkgname=guitar
pkgver=1.2.0
pkgrel=1
pkgdesc="Open source Git GUI Client"
arch=(x86_64 i686 armv6h armv7h aarch64)
url="https://soramimi.github.io/Guitar/"
license=(GPL)
depends=(qt5-svg git file)
makedepends=(cmake qt5-tools)
source=("$pkgname-$pkgver.tar.gz::https://github.com/soramimi/Guitar/archive/v${pkgver}.tar.gz")
sha256sums=('e1f4b2571a44dc763b62957f7633e92baabcaf0fb3f2d4cc7e0d68ec78275ff5')

prepare() {
  cd "Guitar-${pkgver}"
  install -d build
}

build() {
  cd "$srcdir/Guitar-${pkgver}/build"
  cmake ..
  make
}

package() {
  cd "Guitar-${pkgver}"
  install -Dm755 "build/Guitar" "$pkgdir/usr/bin/$pkgname"
  install -D "LinuxDesktop/Guitar.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
  install -D "LinuxDesktop/guitar.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
}

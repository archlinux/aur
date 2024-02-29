# Maintainer: Andy Alt <arch_stanton5995 at proton dot me>

pkgname=canfigger
pkgver=0.3.0
pkgrel=1
pkgdesc="Lightweight configuration file parser library"
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'ppc64le')
url="https://andy5995.github.io/canfigger/"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('meson' 'ninja')
options=('staticlibs')

source=("https://github.com/andy5995/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('3d813e69e0cc3a43c09cf565138ac1278f7bcea74053204f54e3872c094cb534')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

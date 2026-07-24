# Maintainer: Show Studio <linux@show.studio>
pkgname=show-studio
pkgver=1.0.0
pkgrel=1
pkgdesc='Design marching band drill — desktop app for show.studio'
arch=('x86_64')
url='https://show.studio'
license=('LicenseRef-proprietary')
depends=('gtk4' 'webkitgtk-6.0')
makedepends=('meson' 'ninja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Show-Studio/show-studio-linux/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1742128310e5e2202218d6fa0585f6c1a787506ed556fb45fd5a2c7b2b54f3db')

build() {
  arch-meson "show-studio-linux-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# Maintainer: Matt Quintanilla <matt @ matt quintanilla .xyz>
pkgname=mangowc
pkgver=0.12.4
pkgrel=1
pkgdesc="A Wayland compositor with smooth animation"
url="https://github.com/DreamMaoMao/mangowc"
arch=("x86_64")
license=("GPL-3.0")
depends=('glibc' 'wayland>=1.23.1' 'libinput>=1.27.1' 'libdrm' 'pixman' 'libxkbcommon' 'pcre2' 'libwlroots-0.19.so' 'scenefx0.4')
provides=('wayland-compositor')
makedepends=('meson' 'ninja' 'wayland-protocols>=1.41')

source=("$pkgname-$pkgver.tar.gz::https://github.com/DreamMaoMao/mangowc/archive/refs/tags/$pkgver.tar.gz")
md5sums=('9f617688552036cd4346345973fc19bc')

build() {
  cd "$pkgname-$pkgver"
  meson build --prefix /usr
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir/" ninja -C build install
}

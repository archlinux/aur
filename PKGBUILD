# Maintainer: Matt Quintanilla <matt @ matt quintanilla .xyz>
pkgname=mangowc
pkgver=0.11.0
pkgrel=1
pkgdesc="A Wayland compositor with smooth animation"
url="https://github.com/DreamMaoMao/mangowc"
arch=("x86_64")
license=("GPL-3.0")
depends=('glibc' 'wayland>=1.23.1' 'libinput>=1.27.1' 'libdrm' 'pixman' 'libxkbcommon' 'pcre2' 'libwlroots-0.19.so' 'scenefx0.4')
provides=('wayland-compositor')
makedepends=('meson' 'ninja' 'wayland-protocols>=1.41')

source=("$pkgname-$pkgver.tar.gz::https://github.com/DreamMaoMao/mangowc/archive/refs/tags/$pkgver.tar.gz")
md5sums=('de2ccfb201e9f661f190967f175a4c27')

build() {
  cd "$pkgname-$pkgver"
  meson build --prefix /usr
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir/" ninja -C build install
}

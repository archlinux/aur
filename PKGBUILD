# Maintainer: Matt Quintanilla <matt @ matt quintanilla .xyz>
pkgname=mangowm
_pkgname=mango
pkgver=0.12.5
pkgrel=5
pkgdesc="A Wayland compositor with smooth animation"
url="https://github.com/DreamMaoMao/mangowc"
arch=("x86_64")
license=("GPL-3.0")
depends=('glibc' 'wayland>=1.23.1' 'libinput>=1.27.1' 'libdrm' 'pixman' 'libxkbcommon' 'pcre2' 'libwlroots-0.19.so' 'scenefx0.4')
provides=('wayland-compositor' 'mangowc')
conflicts=( 'mangowc')
makedepends=('meson' 'ninja' 'wayland-protocols>=1.41')

source=("$$pkgver.tar.gz::https://github.com/mangowm/mango/archive/refs/tags/$pkgver.tar.gz")
md5sums=('a3782330dd5710d545debf3416f1ad53')

build() {
  cd "$_pkgname-$pkgver"
  meson build --prefix /usr
}

package() {
  cd "$_pkgname-$pkgver"
  DESTDIR="$pkgdir/" ninja -C build install
}


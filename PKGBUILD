# Maintainer: Matt Quintanilla <matt @ matt quintanilla .xyz>
pkgname=mangowm
_pkgname=mango
pkgver=0.14.2
pkgrel=1
pkgdesc="A Wayland compositor with smooth animation"
url="https://github.com/DreamMaoMao/mangowc"
arch=("x86_64")
license=("GPL-3.0")
depends=('glibc' 'wayland>=1.23.1' 'libinput>=1.27.1' 'libdrm' 'pixman' 'libxkbcommon' 'pcre2' 'libwlroots-0.19.so' 'scenefx0.4' 'cjson')
provides=('wayland-compositor' 'mangowc')
replaces=( 'mangowc')
makedepends=('meson' 'ninja' 'wayland-protocols>=1.41')

source=("$_pkgname-$pkgver.tar.gz::https://github.com/mangowm/mango/archive/refs/tags/$pkgver.tar.gz")
md5sums=('294f0f5c20fa0c2a834938fbd7d767d9')

build() {
  cd "$_pkgname-$pkgver"
  meson build --prefix /usr
}

package() {
  cd "$_pkgname-$pkgver"
  DESTDIR="$pkgdir/" ninja -C build install
}


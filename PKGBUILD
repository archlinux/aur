# Maintainer: Matt Quintanilla <matt @ matt quintanilla .xyz>
pkgname=mangowm
_pkgname=mango
pkgver=0.14.4
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
md5sums=('5def85b3b371b02cf40dfe6382121a26')

build() {
  cd "$_pkgname-$pkgver"
  meson build --prefix /usr
}

package() {
  cd "$_pkgname-$pkgver"
  DESTDIR="$pkgdir/" ninja -C build install
}


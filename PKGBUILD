# Maintainer: Matt Quintanilla <matt @ matt quintanilla .xyz>
pkgname=mangowm
_pkgname=mango
pkgver=0.15.1
pkgrel=2
pkgdesc="A Wayland compositor with smooth animation"
url="https://github.com/DreamMaoMao/mangowc"
arch=("x86_64")
license=("GPL-3.0")
depends=('glibc' 'wayland>=1.23.1' 'libinput>=1.27.1' 'libdrm' 'pixman' 'libxkbcommon' 'pcre2' 'libwlroots-0.20.so' 'scenefx0.5' 'cjson')
provides=('wayland-compositor' 'mangowc')
replaces=( 'mangowc')
makedepends=('meson' 'ninja' 'wayland-protocols>=1.41')

source=("$_pkgname-$pkgver.tar.gz::https://github.com/mangowm/mango/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2ecc0400f8a1455262ce999ecbde41845786a091646481cf46dc384280aa90d1')

build() {
  cd "$_pkgname-$pkgver"
  meson build --prefix /usr
}

package() {
  cd "$_pkgname-$pkgver"
  DESTDIR="$pkgdir/" ninja -C build install
}


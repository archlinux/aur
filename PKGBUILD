# Maintainer: Solomon Choina <shlomochoina@gmail.com>
_pkgname=lightdm-webengine-greeter
pkgname=lightdm-webengine-greeter-git
pkgver=r12.bad0705
pkgrel=1
pkgdesc='A modern, visually appealing greeter for LightDM. C++ rewrite of Web Greeter 3.0'
arch=('x86_64')
url="https://github.com/matijaskala/lightdm-webengine-greeter"
license=('GPL3')
depends=('lightdm' 'liblightdm-qt5' 'qt5-webengine' )
optdepends=('at-spi2-core: a11y support')
makedepends=('meson' 'git')
backup=("etc/lightdm/$pkgname.conf")
source=("git+https://github.com/matijaskala/lightdm-webengine-greeter")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson "$_pkgname" build
  ninja -C build
}

package() {
 DESTDIR=$pkgdir ninja -C build install
}

# -*- mode: bash;-*-


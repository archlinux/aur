# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Maximilian Kindshofer <maximilian@kindshofer.net>

pkgname=kitty-git
pkgver=0.13.1.r0.g1ba7b5f5
pkgrel=1
pkgdesc="A modern, hackable, featureful, OpenGL based terminal emulator"
arch=(i686 x86_64)
url="https://github.com/kovidgoyal/kitty"
license=(GPL3)
depends=(python3 freetype2 fontconfig wayland libx11 libgl)
makedepends=(git python-setuptools libxinerama libxcursor libxrandr libxkbcommon libxkbcommon-x11 glfw-x11 wayland-protocols mesa python-sphinx)
optdepends=('imagemagick: viewing images with icat')
provides=(kitty)
conflicts=(kitty)
source=("git+https://github.com/kovidgoyal/kitty.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname/-git/}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/${pkgname/-git/}"

  python3 setup.py linux-package --prefix "${pkgdir}"/usr
}

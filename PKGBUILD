# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Maximilian Kindshofer <maximilian@kindshofer.net>

pkgname=kitty-git
pkgver=0.11.0.r45.g49b065cb
pkgrel=1
pkgdesc="A modern, hackable, featureful, OpenGL based terminal emulator"
arch=('i686' 'x86_64')
url="https://github.com/kovidgoyal/kitty"
license=('GPL3')
depends=('python3' 'freetype2'  'fontconfig' 'wayland' 'libx11')
makedepends=('git' 'python-setuptools' 'libxinerama' 'libxcursor' 'libxrandr' 'libxkbcommon' 'libxkbcommon-x11' 'glfw-x11' 'wayland-protocols' 'mesa' python-sphinx)
optdepends=('imagemagick: viewing images with icat')
provides=('kitty')
conflicts=('kitty' 'kitty-git')
source=("${pkgname}::git+https://github.com/kovidgoyal/kitty.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${pkgname}"

  python3 setup.py linux-package --prefix "${pkgdir}"/usr
}

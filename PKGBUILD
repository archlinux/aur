# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=python-glfw
pkgver=2.5.3
pkgrel=1
pkgdesc='Module for OpenGL, OpenGL ES, Vulkan, window and input support'
arch=(any)
url='https://github.com/FlorianRhiem/pyGLFW'
license=(MIT)
depends=(glfw python)
makedepends=(git python-setuptools)
source=("git+$url#commit=ada90b17b6c15d077de64cb9a5c7a0c5651c6886") # tag: v2.1.0
md5sums=('SKIP')

build() {
  cd pyGLFW
  python setup.py build
}

package() {
  cd pyGLFW
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

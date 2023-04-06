# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=python-glfw
pkgver=2.5.7
pkgrel=2
pkgdesc='Module for OpenGL, OpenGL ES, Vulkan, window and input support'
arch=(any)
url='https://github.com/FlorianRhiem/pyGLFW'
license=(MIT)
depends=(glfw python)
makedepends=(git python-setuptools)
source=("git+$url#commit=6dcde439cd18290e42af4946e2e549ed53b26170") # tag: v2.5.7
b2sums=('SKIP')

build() {
  cd pyGLFW
  python setup.py build
}

package() {
  cd pyGLFW
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

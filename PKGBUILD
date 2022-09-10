# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=python-glfw
pkgver=2.5.5
pkgrel=1
pkgdesc='Module for OpenGL, OpenGL ES, Vulkan, window and input support'
arch=(any)
url='https://github.com/FlorianRhiem/pyGLFW'
license=(MIT)
depends=(glfw python)
makedepends=(git python-setuptools)
source=("git+$url#commit=f7827d094999ee487a4a778a22e6b9686f5c0488") # tag: v2.5.5
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

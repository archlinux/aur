# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=python-glfw
pkgver=1.8.4
pkgrel=1
pkgdesc='Module for OpenGL, OpenGL ES, Vulkan, window and input support'
arch=(any)
url='https://github.com/FlorianRhiem/pyGLFW'
license=(MIT)
depends=(glfw python)
makedepends=(git python-setuptools)
# tag: 1.8.4
source=("git+$url#commit=e247b3d51c8430b0a79fb41fb1f8467032752835")
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

# getver: github.com/FlorianRhiem/pyGLFW
# vim: ts=2 sw=2 et:

# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=python-glfw
pkgver=2.6.5
pkgrel=1
pkgdesc='Module for OpenGL, OpenGL ES, Vulkan, window and input support (pyGLFW)'
arch=(any)
url='https://github.com/FlorianRhiem/pyGLFW'
license=(MIT)
depends=(glfw python)
makedepends=(git python-setuptools)
source=("git+$url#commit=bce6e2e53bcc46858a7d1c5029ae6ee24763ae4f") # tag: v2.6.5
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

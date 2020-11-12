# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=python-glfw
pkgver=2.0.0
pkgrel=2
pkgdesc='Module for OpenGL, OpenGL ES, Vulkan, window and input support'
arch=(any)
url='https://github.com/FlorianRhiem/pyGLFW'
license=(MIT)
depends=(glfw python)
makedepends=(git python-setuptools)
source=("git+$url#commit=e988aa623a4a8da08b53f68246424306c4fa5982") # tag: v2.0.0
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

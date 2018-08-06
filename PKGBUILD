# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=python-glfw
pkgver=1.7.0
pkgrel=2
pkgdesc='Module for OpenGL, OpenGL ES, Vulkan, window and input support'
arch=('any')
url='https://github.com/FlorianRhiem/pyGLFW'
license=('MIT')
depends=('glfw' 'python')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/FlorianRhiem/pyGLFW#tag=v$pkgver")
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

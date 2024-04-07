# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=python-glfw
pkgver=2.7.0
pkgrel=2
pkgdesc='Module for OpenGL, OpenGL ES, Vulkan, window and input support (pyGLFW)'
arch=(any)
url='https://github.com/FlorianRhiem/pyGLFW'
license=(MIT)
depends=(glfw python)
makedepends=(git python-setuptools)
source=("git+$url#commit=d649113ecaac5c211f01afb864548cdfa87e2ac6") # tag: v2.7.0
b2sums=('46f91af1e856c98c688110194f1dd3f3ab0711c483b175da63e209ad7fa7d144922937e3c9e8a311dd77374796456e484f820e89e7367776ca3d8efb61251c92')

build() {
  cd pyGLFW
  python setup.py build
}

package() {
  cd pyGLFW
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

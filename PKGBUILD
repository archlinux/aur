# Contributor: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=python-glfw
pkgver=2.10.0
pkgrel=1
pkgdesc='Module for OpenGL, OpenGL ES, Vulkan, window and input support (pyGLFW)'
arch=(any)
url='https://github.com/FlorianRhiem/pyGLFW'
license=(MIT)
depends=(glfw python)
makedepends=(python-setuptools)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('440509e0cfc8d62e6f10c3704d77a69ca64feb51ac2936a0176ba094eb724b9ee1b830cc6678824a8838e8301e497d69346b8f187c34aa787aa84b6dc492e9c8')

build() {
  cd pyGLFW-${pkgver}
  python setup.py build
}

package() {
  cd pyGLFW-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

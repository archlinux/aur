# Contributor: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=python-glfw
pkgver=2.9.0
pkgrel=1
pkgdesc='Module for OpenGL, OpenGL ES, Vulkan, window and input support (pyGLFW)'
arch=(any)
url='https://github.com/FlorianRhiem/pyGLFW'
license=(MIT)
depends=(glfw python)
makedepends=(git python-setuptools)
source=("git+$url#commit=4ecaed5a7313fc1eeaefc15eb381117d15ea44b3") # tag: v2.9.0
b2sums=('0223adc093a33768e6dfb10dad4565893612e5b3172b2a966c5989a0030358ff748d2144ca4a74a5ff54ca75e8593bcc1d89e70fbe95eaf71e847d873a3dd45e')

build() {
  cd pyGLFW
  python setup.py build
}

package() {
  cd pyGLFW
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

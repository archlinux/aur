# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=python-pyxel
pkgver=0.7.10
pkgrel=1
pkgdesc='Retro game development environment'
arch=('any')
url='https://github.com/kitao/pyxel'
license=('MIT')
depends=('portaudio' 'python-glfw' 'python-numpy' 'python-opengl'
         'python-pillow' 'python-sounddevice')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/kitao/pyxel#tag=v$pkgver")
md5sums=('SKIP')

build() {
  cd pyxel

  python setup.py build
}

package() {
  cd pyxel

  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:

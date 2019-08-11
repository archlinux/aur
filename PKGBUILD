# Maintainer: Alexander Fasching <fasching.a91@gmail.com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=python-pyxel
pkgver=1.2.3
pkgrel=1
pkgdesc='Retro game development environment'
arch=('i686' 'x86_64')
url='https://github.com/kitao/pyxel'
license=('MIT')
depends=('portaudio' 'python-glfw' 'python-numpy' 'python-opengl'
         'python-pillow' 'python-sounddevice' 'sdl2_image')
makedepends=('python-setuptools')
source=("https://github.com/kitao/pyxel/archive/v$pkgver.tar.gz")
md5sums=('d4585470ff3eb3322f80069862980abd')

build() {
  cd pyxel-$pkgver

  python setup.py build
}

package() {
  cd pyxel-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:

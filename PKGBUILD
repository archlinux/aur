# Maintainer: Jesse Jaara <jesse.jaara@gmail.com>

pkgname=python-pygame_sdl2-git
pkgver=renpy.6.99.0.303.r28.gd5869f1
pkgrel=1
pkgdesc="Reimplementation of portions of the pygame API using SDL2."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/brandy/files/brandy/brandy-1.20/brandy-1.20.1.tar.gz/download"
license=('GPL')
groups=('zlib' 'LGPL')
depends=('python' 'sdl2_mixer' 'sdl2_image' 'sdl2_gfx' 'sdl2_ttf')
makedepends=('git' 'cython')
source=(git+https://github.com/renpy/pygame_sdl2.git)
md5sums=(SKIP)

pkgver() {
  cd "pygame_sdl2"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/pygame_sdl2"

  python setup.py build
}

package() {
  cd "${srcdir}/pygame_sdl2"

  python setup.py install --optimize=1 --root="${pkgdir}/"
}

# vim:set ts=2 sw=2 et:

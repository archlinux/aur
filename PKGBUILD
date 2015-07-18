# Maintainer: feuri <padfoot at exemail dot com dot au>
# Contributor: feuri <mail at feuri dot de>

pkgname=python-pysdl2
pkgver=0.9.3
pkgrel=1
pkgdesc="A Python wrapper around the SDL2 library"

arch=('i686' 'x86_64')
url="https://bitbucket.org/marcusva/py-sdl2/overview"
license=('custom:CC0')

depends=('python' 'sdl2')
optdepends=('sdl2_gfx' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf')

source=(https://bitbucket.org/marcusva/py-sdl2/downloads/PySDL2-${pkgver}.tar.gz)
md5sums=('0ee011fdb68c0c04753cac11f97c8f9d')

build() {
  cd "${srcdir}/PySDL2-${pkgver}"
  python3 setup.py build
}

package() {
  cd "${srcdir}/PySDL2-${pkgver}"
  python3 setup.py install --root="${pkgdir}"
  install -m 644 -D doc/copying.rst ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

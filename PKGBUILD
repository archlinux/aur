# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: feuri <padfoot at exemail dot com dot au>
# Contributor: feuri <mail at feuri dot de>

pkgname=python-pysdl2
pkgver=0.9.6
pkgrel=1
pkgdesc="Python ctypes wrapper around SDL2"
arch=('any')
url="https://github.com/marcusva/py-sdl2"
license=('custom:CC0')
depends=('python' 'sdl2')
optdepends=('sdl2_gfx' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf')
_srcpath='eb/08/8a81128ff6ca89019de9771425638bc197a28f40c1e377f03626baa5d729'
source=("https://pypi.python.org/packages/${_srcpath}/PySDL2-$pkgver.tar.gz"{,.asc})
sha256sums=('b52acab5493a77b08c2afee1f385769fc2005f17cfeaf1886eff22dc78da2123'
            'SKIP')
validpgpkeys=('8045642355B844E284606ED2F5645D06D1395E36') # Marcus von Appen

package() {
  cd PySDL2-$pkgver
  python setup.py install --root="$pkgdir"
  install -Dm644 doc/copying.rst "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

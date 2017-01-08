# Maintainer: Shane "SajeOne" Brown <contact@shane-brown.ca>
pkgname=python-colorthief
pkgver=0.2
pkgrel=2
pkgdesc="A Python module for grabbing the color palette from an image."
arch=('any')
url="https://github.com/fengsp/color-thief-py"
license=('custom:3-clause BSD')
depends=('python' 'python-pillow')
makedepends=('python-setuptools')
provides=('python-colorthief')
source=("https://github.com/fengsp/color-thief-py/archive/$pkgver.tar.gz")
sha256sums=('7a7e00bb62ca4698b268b5aea0368d337443c4b10affd4e9f6b80b64a957eeff')
_gitname=color-thief-py

package() {
  cd "$srcdir/$_gitname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

  #LICENSE
  install -D -m644 "$srcdir/$_gitname-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

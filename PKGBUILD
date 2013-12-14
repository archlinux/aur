# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=python2-misaka
pkgver=1.0.2
pkgrel=2
pkgdesc="The Python binding for Sundown, a markdown parsing library."
arch=('i686' 'x86_64')
url="http://misaka.61924.nl/"
license=('MIT')
depends=('python2')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/m/misaka/misaka-${pkgver}.tar.gz"
        'LICENSE')
sha256sums=('6197e4886ff0c2718df1b472e40b5fea45f447a7a5b0192a48123ee868973517'
            '0fed45cfa40d1ceed4bf0173f11af10e962d2647a4beb7c0e8250a30720a1890')

package() {
  cd "$srcdir/misaka-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/misaka-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

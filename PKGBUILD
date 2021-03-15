# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com>
# Contributor: mutantmonkey <aur@mutantmonkey.in>
pkgname=python2-misaka
pkgver=2.1.1
pkgrel=1
pkgdesc="The Python binding for Sundown, a markdown parsing library."
arch=('i686' 'x86_64')
url="https://misaka.61924.nl/"
license=('MIT')
depends=('python2')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/m/misaka/misaka-${pkgver}.tar.gz"
        'LICENSE')
sha256sums=('62f35254550095d899fc2ab8b33e156fc5e674176f074959cbca43cf7912ecd7'
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
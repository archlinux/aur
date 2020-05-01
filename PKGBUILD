# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-branca
_pkgname=branca
pkgver=0.4.0
pkgrel=1
pkgdesc="Generate html+js with Python."
arch=('any')
url="https://github.com/python-vizualisation/branca"
license=('MIT')
checkdepends=('python-nose' 'python-selenium' 'geckodriver')
depends=('python' 'python-jinja')
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/python-visualization/branca/archive/v$pkgver.tar.gz")
sha256sums=('d97a02d51ee7e895953e941f6c8163d261bb055040f7df77701bdd0f9e52f3ac')

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    nosetests
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

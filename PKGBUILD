# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-branca
_pkgname=branca
pkgver=0.3.1
pkgrel=1
pkgdesc="Generate html+js with Python."
arch=('any')
url="https://github.com/python-vizualisation/branca"
license=('MIT')
checkdepends=('python-nose' 'python-selenium' 'geckodriver')
depends=('python' 'python-jinja')
options=(!emptydirs)
source=("https://github.com/python-visualization/branca/archive/v$pkgver.tar.gz")
sha256sums=('eeb27c4afb692510bc516dd42733bc606dda023d6b7dd42a67046464489af3e2')

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    nosetests
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

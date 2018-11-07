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
sha256sums=('0d0e784e120036f92cd9fafdb9a45763f787735d7af65cdfbbcb7df73ba81e31')

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    nosetests
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

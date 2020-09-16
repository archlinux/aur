# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-branca
_pkgname=branca
pkgver=0.4.1
pkgrel=1
pkgdesc="Generate html+js with Python."
arch=('any')
url="https://github.com/python-visualization/branca"
license=('MIT')
checkdepends=('python-nose' 'python-selenium' 'geckodriver')
depends=('python-jinja')
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/python-visualization/branca/archive/v$pkgver.tar.gz")
sha256sums=('e75775305ddfb577786a418934233490a965314a13ac058a7fd44e00aa4c50b3')

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    nosetests
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

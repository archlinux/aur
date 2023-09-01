# Maintainer: Gerry

_pkgname=svgutils
pkgname=python-$_pkgname
pkgver=0.3.4
pkgrel=1
pkgdesc="Python SVG editor"
arch=('any')
url="https://github.com/btel/svg_utils"
license=('MIT')
depends=('python' 'python-matplotlib' 'python-lxml')
#depends=('python' 'python-nose' 'python-numpydoc' 'python-sphinx' 'python-sphinx_rtd_theme' 'python-matplotlib' 'python-lxml')
source=("https://files.pythonhosted.org/packages/source/s/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "COPYING")
sha256sums=('9ef48f44cb1d460a7747dd02694200fda25eb9faf6dea392118def2695e0e053'
            '8253750322b51a4e7acc420462e22b2167da00d3594ea598f0367835dd742f92')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
  cd "$srcdir"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m 644 "COPYING" "$pkgdir/usr/share/licenses/$pkgname/"
}

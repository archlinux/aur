# Contributor: Francois Boulogne <fboulogne at april dot org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>
# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-dask
_pkgname=dask
pkgver=0.14.1
pkgrel=1
pkgdesc="Minimal task scheduling abstraction"
arch=('any')
url="https://github.com/dask/dask"
license=('BSD')
depends=('python' 'python-numpy' 'python-scipy' 'python-pandas' 'python-toolz' 'python-cloudpickle' 'python-partd' )
checkdepends=('python-bcolz' 'python-bokeh' 'python-cachey' 'python-graphviz' 'python-scikit-learn' 'python-scikit-image')
optdepends=('python-bcolz' 'python-cachey' 'python-fastparquet' 'python-bokeh' 'python-psutil')
makedepends=('python-setuptools')
source=("https://github.com/dask/dask/archive/$pkgver.tar.gz")
sha256sums=('98b989e90aa017f87adc05f9c1dcdcd57e2869c3a09a1d73bb1d7f526968d456')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}

#check(){
#  cd "$srcdir/$_pkgname-$pkgver"
#  python setup.py test
#}
# vim:ts=2:sw=2:et:

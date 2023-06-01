# Maintainer: Bernardo Gameiro <projects@bgameiro.me>

pkgbase='python-intake'
pkgname=('python-intake')
pkgver=0.7.0
pkgrel=1
pkgdesc='A general interface for loading data'
arch=('any')
url='https://intake.readthedocs.io/'
license=('BSD')
source=("https://files.pythonhosted.org/packages/source/i/intake/intake-$pkgver.tar.gz")
sha256sums=('ce3b8bce87f9831823f87936c546f898dbb718985770124c7cc569061726f3b6')
provides=("python-intake=$pkgver")

build() {
  cd "${srcdir}"/intake-$pkgver
  python setup.py build
} 

package_python-intake() {
  depends=(
         'python>=3.8.0'
         'python-appdirs'
         'python-dask'
         'python-entrypoints'
         'python-fsspec>=2021.7.0'
	       'python-jinja'
         'python-msgpack'
         'python-pyyaml'
         'python-requests')
  optdepends=(
         'python-tornado: For intake server'
         'python-snappy: For intake server'
         'python-msgpack: For intake server'
         'python-hvplot: For intake plot'
	       'python-panel>=0.7.0: For intake plot'
         'python-bokeh: For intake plot'
         'python-dask: For intake dataframe'
         'python-msgpack-numpy: For intake dataframe'
         'python-pyarrow: For intake dataframe'
         'python-requests: For intake remote')

  cd "${srcdir}"/intake-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}
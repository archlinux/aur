# Maintainer: Bernardo Gameiro <projects@bgameiro.me>
# Maintainer: Pierpaolo Valerio <gondsman@techgeek.co.in>
# Contributor: Excitable Snowball <excitablesnowball@gmail.com>

pkgbase='python-bokeh2'
pkgname=('python-bokeh2')
pkgver=2.4.3
pkgrel=1
pkgdesc='Interactive Web Plotting for Python'
arch=('any')
url='http://bokeh.pydata.org/'
license=('BSD')
source=("https://pypi.io/packages/source/b/bokeh/bokeh-${pkgver}.tar.gz")
sha256sums=('ef33801161af379665ab7a34684f2209861e3aefd5c803a21fbbb99d94874b03')
makedepends=('python-setuptools')

build() {
  cd "${srcdir}"/bokeh-$pkgver
  python setup.py build
} 

package_python-bokeh2() {
  depends=(
         'python-numpy'
         'python-six'
         'python-flask'
         'python-jinja'
         'python-requests'
	       'python-pillow'
         'python-yaml'
         'python-tornado'
         'python-packaging'
         'python-typing_extensions')
  optdepends=(
         'python-selenium: svg export'
         'geckodriver: svg export'
         'firefox: svg export'
         'nodejs: extending Bokeh'
         'python-pandas: Pandas support'
         'python-psutil: detailed memory logging'
         'python-networkx: plot directly from NetworkX data'
         'python-sphinx: support sphinx documentation')

  cd "${srcdir}"/bokeh-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}
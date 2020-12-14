# Maintainer: Daniel Maslowski <info@orangecms.org>

_pyname=conda-build
pkgname=python-conda-build
pkgver=3.20.5
pkgrel=1
pkgdesc="Commands and tools for building conda packages"
arch=('any')
url="http://conda.pydata.org/docs/building/build.html"
license=('BSD')
depends=(
  'patchelf'
  'python'
  'python-beautifulsoup4'
  'python-chardet'
  'python-conda'
  'python-conda-verify'
  'python-filelock'
  'python-future' # may be unneeded now
  'python-glob2-git' # may be unneeded now
  'python-jinja'
  'python-libarchive-c'
  'python-pkginfo'
  'python-psutil'
  'python-pytz'
  'python-requests'
  'python-six'
  'python-tqdm'
  'python-yaml'
)
makedepends=('python-setuptools')
provides=("$_pyname")
options=(!emptydirs)
source=(https://github.com/conda/$_pyname/archive/$pkgver.tar.gz)
sha512sums=('e8e96fceb0cb529050d3a8c0d45f9c46ad2d444b146aefc0bebb0ee4cfc7834b2f996b3bbec12e95375594b7139b08cf466955c96e833ef154f4b8fdbcc32567')

package() {
  cd "$srcdir/${_pyname}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 LICENSE.txt $pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt
}

# vim:set ts=2 sw=2 et:

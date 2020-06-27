# Maintainer: Daniel Maslowski <info@orangecms.org>

_pyname=conda-build
pkgname=python-conda-build
pkgver=3.19.3
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
provides=("$_pyname")
options=(!emptydirs)
source=(https://github.com/conda/$_pyname/archive/$pkgver.tar.gz)
sha512sums=('28e6825418c5c6eccdb7ce9b599a2f42202a640f2ae97876e8c7192223237a0c85ec8ca95f6ee500477bb7c8951f6808cdf35eb592f6f47119254f5c5f23c43a')

package() {
  cd "$srcdir/${_pyname}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 LICENSE.txt $pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt
}

# vim:set ts=2 sw=2 et:

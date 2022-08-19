# Maintainer: Daniel Maslowski <info@orangecms.org>

_pyname=conda-build
pkgname=python-conda-build
pkgver=3.22.0
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
sha512sums=('0777c6b87194f88da2d76e59bfb8d64e4775ee46490fd13d2504cd5565e4ff638f53dccc7b370a2fca2ac347f5b3520090c4313c531082ea113cc96ad6a9622a')

package() {
  cd "$srcdir/${_pyname}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 LICENSE.txt $pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt
}

# vim:set ts=2 sw=2 et:

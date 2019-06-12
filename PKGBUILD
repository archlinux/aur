# Maintainer: Daniel Maslowski <info@orangecms.org>

_pyname=conda-build
pkgname=python-conda-build
pkgver=3.18.2
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
sha512sums=('b0fd94db0add4589a756d28019107269d185219d96c3deffb6cd9b7780c8924ff0bdda89b00fde28536fca8f8c78bb6543dd87f7a2993b226206d91eb05de63d')

package() {
  cd "$srcdir/${_pyname}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 LICENSE.txt $pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt
}

# vim:set ts=2 sw=2 et:

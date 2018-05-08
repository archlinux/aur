# Maintainer: Daniel Maslowski <info@orangecms.org>

_pyname=conda-build
pkgname=python-${_pyname}
pkgver=3.10.2
pkgrel=1
pkgdesc="Commands and tools for building conda packages"
arch=('any')
url="http://conda.pydata.org/docs/building/build.html"
license=('BSD')
depends=(
  'patchelf'
  'python'
  'python-beautifulsoup4'
  'python-conda'
  'python-conda-verify'
  'python-filelock'
  'python-glob2-git'
  'python-jinja'
  'python-pkginfo'
  'python-requests'
  'python-yaml'
)
provides=("$_pyname")
options=(!emptydirs)
source=(https://github.com/conda/$_pyname/archive/$pkgver.tar.gz)
sha512sums=('14ffc71212ef0a3038716f0130551aaecb804ed4bb8ea8d0f9213c7b10291810d84d1c8d154661f0e0eadc606c3633a9b62102a7e84608b29e6e06e02823654c')

package() {
  cd "$srcdir/${_pyname}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 LICENSE.txt $pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt
}

# vim:set ts=2 sw=2 et:

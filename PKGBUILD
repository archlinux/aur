# Maintainer: Daniel Maslowski <info@orangecms.org>

_pyname=conda
pkgname=python-conda
pkgver=4.0.5
pkgrel=2
pkgdesc="OS-agnostic, system-level binary package manager and ecosystem"
arch=('any')
url="http://conda.pydata.org/docs/"
license=('BSD')
groups=()
depends=('python' 'python-psutil' 'python-pycosat>=0.6.1' 'python-requests' 'python-yaml')
makedepends=()
optdepends=(
  'python-conda-env: to use the conda env command'
  'python-conda-build: to use the conda build command'
)
provides=('conda')
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(https://github.com/$_pyname/$_pyname/archive/$pkgver.tar.gz)
sha512sums=('ccd5c4b841542210e8aa3df23b55f9db37e2086e6f85bfa8a94515054f961b1fe88eb5eadcce38b785e56bf89b383f697a98945b5954cc7db92382eded8b7d22')

package() {
  cd "$srcdir/${_pyname}-$pkgver"
  echo $pkgver > .version
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 bin/conda.fish $pkgdir/usr/share/fish/functions/conda.fish
  install -Dm 644 LICENSE.txt $pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt
}

# vim:set ts=2 sw=2 et:

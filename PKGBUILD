# Maintainer: Daniel Maslowski <info@orangecms.org>

_pyname=conda
pkgname=python-conda
pkgver=4.1.0
pkgrel=1
pkgdesc="OS-agnostic, system-level binary package manager and ecosystem"
arch=('any')
url="http://conda.pydata.org/docs/"
license=('BSD')
groups=()
depends=('python' 'python-pycosat>=0.6.1' 'python-requests' 'python-yaml')
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
sha512sums=('996b129b98cada3cae1d7ddae70332f4077f3124349cb1a1ae747f4d82a1d9916c516d0fd03ee6ffa3e62efaf6d715110eaee2e5f31f147c6d0bf24b69a34836')

package() {
  cd "$srcdir/${_pyname}-$pkgver"
  echo $pkgver > conda/.version
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 bin/conda.fish $pkgdir/usr/share/fish/functions/conda.fish
  install -Dm 644 LICENSE.txt $pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt
}

# vim:set ts=2 sw=2 et:

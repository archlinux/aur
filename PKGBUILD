# Maintainer: Daniel Maslowski <info@orangecms.org>

_pyname=conda-env
pkgname=python-${_pyname}
pkgver=2.4.5
pkgrel=2
pkgdesc="Provides a unified interface to dealing with Conda environments"
arch=('any')
url="http://conda.pydata.org/docs/using/envs.html"
license=('BSD')
groups=()
depends=('python' 'python-conda')
makedepends=()
provides=("$_pyname" 'activate' 'deactivate')
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(https://github.com/conda/$_pyname/archive/v$pkgver.tar.gz)
sha512sums=('4390491085c482991b7d9db643e8e7865863a7529d98770e89f4cdae20e989e84a473c7a49fdf75b7d6fdee6998ef37946254a66e31fcd61b90395d9abb6a903')

package() {
  cd "$srcdir/${_pyname}-$pkgver"
  echo $pkgver > .version
  CONDA_DEFAULT_ENV=''
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 LICENSE.txt $pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt
}

# vim:set ts=2 sw=2 et:

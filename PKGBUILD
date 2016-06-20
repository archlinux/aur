# Maintainer: Daniel Maslowski <info@orangecms.org>

_pyname=conda-env
pkgname=python-${_pyname}
pkgver=2.5.1
pkgrel=1
pkgdesc="Provides a unified interface to dealing with Conda environments"
arch=('any')
url="http://conda.pydata.org/docs/using/envs.html"
license=('BSD')
groups=()
depends=('python' 'python-conda')
makedepends=()
provides=("$_pyname")
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(https://github.com/conda/$_pyname/archive/v$pkgver.tar.gz)
sha512sums=('a6101763064cf4033dcf21959dbba3f1ec9f078c5dca31bf2d9877d09738a0f5bc8bfd0b83f57d49b2361ecffa0031caa48eed9971fb3b13b6e8c41ac0574a9b')

package() {
  cd "$srcdir/${_pyname}-$pkgver"
  echo $pkgver > .version
  CONDA_DEFAULT_ENV=''
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 LICENSE.txt $pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt
}

# vim:set ts=2 sw=2 et:

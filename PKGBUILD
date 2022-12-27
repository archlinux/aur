# Maintainer: None
# Contributor: None

pkgname=python-pint-pandas
_name=${pkgname#python-}
_download=Pint-Pandas
pkgver=0.3
pkgrel=1
pkgdesc='Pandas support for pint.'
arch=(any)
url="https://github.com/hgrecco/pint-pandas"
license=(BSD)
depends=(python-pint)
makedepends=(python-build python-installer python-wheel)
# source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_download-$pkgver.tar.gz)
sha256sums=('154c05ebe3a295abe8c177a90317bae887d37ea5b88813a38e10e1d64fd1589d')

build() {
  # cd $_name-$pkgver
  cd $_download-$pkgver
  python -m build --wheel --no-isolation
}

package(){
  cd $_download-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

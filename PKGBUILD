# Maintainer: Paul Irofti <paul@irofti.net>
_name=cmdstanpy
pkgname="python-$_name"
pkgver=1.2.4
pkgrel=1
pkgdesc="Python interface to CmdStan"
arch=('any')
url="https://github.com/stan-dev/cmdstanpy"
depends=('python'
  'python-pandas'
  'python-numpy'
  'python-tqdm'
  'python-stanio')
makedepends=('python-setuptools')
license=('BSD')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('ad586be0b9f4c654ecbdc4af4541f4d282f99175956cda88cc5eb873719356cc')

build() {
  cd "$srcdir/$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set sw=2 et:

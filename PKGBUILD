# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=flax
pkgname=python-$_modulename
pkgver=0.3.4
pkgrel=0
pkgdesc="A neural network library and ecosystem for JAX designed for flexibility"
arch=(any)
url="https://github.com/google/flax"
license=('Apache')
groups=()
depends=('python-jax')
makedepends=('python-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('625acc6c3dce6eef6349eff5076db5519dec4aa04bd1338dcb38bcc156696f95')
build() {
  cd "$srcdir/$_modulename-$pkgver/"
  python setup.py build
}
package() {
  cd "$srcdir/$_modulename-$pkgver/"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

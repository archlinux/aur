# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=edgar-ssh
_upname=edgar
pkgver=2.0
pkgrel=1
pkgdesc="A small utility to maintain SSH config files"
arch=("any")
url="https://git.umaneti.net/${_upname}/about/"
license=("WTFPL")
depends=("python-yaml")
makedepends=("python-setuptools")
source=("https://git.umaneti.net/${_upname}/snapshot/${_upname}-${pkgver}.tar.gz")
sha256sums=('f00ee6af4240a6dae3e6d6fe826220896b6841d07a88f1b98ec55ded647399c6')

package() {
  cd "${_upname}-$pkgver"
  python setup.py install --no-compile --root="$pkgdir"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_upname}/LICENSE"
}

# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=edgar-ssh
_upname=edgar
pkgver=3.0
pkgrel=1
pkgdesc="A small utility to maintain SSH config files"
arch=("any")
url="https://git.umaneti.net/${_upname}/about/"
license=("WTFPL")
depends=("python-yaml")
makedepends=("python-setuptools")
source=("https://git.umaneti.net/${_upname}/snapshot/${_upname}-${pkgver}.tar.gz")
sha256sums=('5e31ecec414d6f2ff35897ad4ffdf3663b7c71f03e654ebce4b0e77dbef3c558')

package() {
  cd "${_upname}-$pkgver"
  python setup.py install --no-compile --root="$pkgdir"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_upname}/LICENSE"
}

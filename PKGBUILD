# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=edgar-ssh
_upname=edgar
pkgver=5.0
pkgrel=1
pkgdesc="A small utility to maintain SSH config files"
arch=("any")
url="https://git.umaneti.net/${_upname}/about/"
license=("WTFPL")
depends=("python-yaml")
makedepends=("python-setuptools")
source=("https://git.umaneti.net/${_upname}/snapshot/${_upname}-${pkgver}.tar.gz")
sha256sums=('aa949451143e939d497b198b6064b567a793c2803c2ac25729eb4b03248c4fec')

package() {
  cd "${_upname}-$pkgver"
  python setup.py install --no-compile --root="$pkgdir"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_upname}/LICENSE"
}

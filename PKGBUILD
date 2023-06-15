# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=edgar-ssh
_upname=edgar
pkgver=4.0
pkgrel=1
pkgdesc="A small utility to maintain SSH config files"
arch=("any")
url="https://git.umaneti.net/${_upname}/about/"
license=("WTFPL")
depends=("python-yaml")
makedepends=("python-setuptools")
source=("https://git.umaneti.net/${_upname}/snapshot/${_upname}-${pkgver}.tar.gz")
sha256sums=('5bf347996ee0be228c29267b8c91e58957378dea9e86cc21696daa5b0c8242a5')

package() {
  cd "${_upname}-$pkgver"
  python setup.py install --no-compile --root="$pkgdir"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_upname}/LICENSE"
}

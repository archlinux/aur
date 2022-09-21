# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=edgar-ssh
_upname=edgar
pkgver=1.1
pkgrel=2
pkgdesc="A small utility to maintain SSH config files"
arch=("any")
url="https://git.umaneti.net/${_upname}/about/"
license=("WTFPL")
depends=("python-yaml")
makedepends=("python-setuptools")
source=("https://git.umaneti.net/${_upname}/snapshot/${_upname}-${pkgver}.tar.gz")
sha256sums=('7cb686afdf9e94f586b93f54d88905331bbcdbdc929207e9b312eb362aab171a')

package() {
  cd "${_upname}-$pkgver"
  python setup.py install --no-compile --root="$pkgdir"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_upname}/LICENSE"
}

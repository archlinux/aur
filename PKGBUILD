# Maintainer: Étienne André <eti.andre@gmail.com>
pkgname='python-fusepy'
pkgver=2.0.2
pkgrel=2
pkgdesc='Simple ctypes bindings for FUSE'
url='https://github.com/terencehonles/fusepy'
arch=('any')
license=('custom:ISCL')
depends=('fuse>=2.6' 'python')
makedepends=('python-setuptools')
source=("https://github.com/terencehonles/fusepy/archive/v${pkgver}.tar.gz")
sha256sums=('31fe3f8731d33200fea2f97ab64a1b8e68dae0b48c5c1bd9e7485a9905636bc6')

package() {
  cd "${srcdir}/fusepy-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1

  sed -n '/Copyright/,/ THIS SOFTWARE[.]/p' fuse.py > LICENSE
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

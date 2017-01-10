# Maintainer: Dimitrios Vogiatzis <me@dimtree.net>
# Contributor: Étienne André <eti.andre@gmail.com>
pkgname='python-fusepy'
pkgver=2.0.4
pkgrel=2
pkgdesc='Simple ctypes bindings for FUSE'
url='https://github.com/terencehonles/fusepy'
arch=('any')
license=('custom:ISCL')
depends=('fuse2>=2.6' 'python')
makedepends=('python-setuptools')
source=("https://github.com/terencehonles/fusepy/archive/v${pkgver}.tar.gz")
sha256sums=('802610ab25ad04fc9ef34d024a0abe41cdcaff6a2cb8b2fb92cdda0057c09d1f')

package() {
  cd "${srcdir}/fusepy-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1

  sed -n '/Copyright/,/ THIS SOFTWARE[.]/p' fuse.py > LICENSE
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

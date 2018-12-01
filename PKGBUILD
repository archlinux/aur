# Maintainer: Javier Tiá <javier.tia at gmail dot com>

pkgname='python2-fusepy'
_pkgname=fusepy
pkgver=2.0.4
pkgrel=2
pkgdesc='Simple ctypes bindings for FUSE'
url='https://github.com/terencehonles/fusepy'
arch=('any')
license=('custom:ISCL')
depends=('fuse>=2.6' 'python2')
makedepends=('python2-setuptools')
conflicts=('python2-fusepy-git')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('802610ab25ad04fc9ef34d024a0abe41cdcaff6a2cb8b2fb92cdda0057c09d1f')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  sed -n '/Copyright/,/ THIS SOFTWARE[.]/p' fuse.py > LICENSE
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

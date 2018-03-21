# Maintainer: Vinicius Correa <vinicius dot correa at zoho dot com>
_pkgname=service_identity
pkgname=python2-service_identity
pkgver=17.0.0
pkgrel=1
pkgdesc="Service identity verification for pyOpenSSL."
arch=('any')
url="https://service-identity.readthedocs.io"
license=('GPL')
depends=('python2' 'python2-attrs' 'python2-pyopenssl' 'python2-pyasn1' 'python2-pyasn1-modules' 
 'python2-cryptography' 'python2-six' 'python2-idna' 'python2-asn1crypto' 'python2-cffi'
 'python2-enum34' 'python2-ipaddress' 'python2-pycparser')
makedepends=('git')
optdepends=()
conflicts=()
source=("https://pypi.python.org/packages/de/2a/cab6e30be82c8fcd2339ef618036720eda954cf05daef514e386661c9221/${_pkgname}-${pkgver}.tar.gz")
md5sums=('f509cb41ca2f8420bd8496291136d6cc')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

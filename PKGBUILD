# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=python-grpcio
pkgver=1.8.2
pkgrel=1
pkgdesc="HTTP/2-based RPC framework"
arch=('any')
url="https://grpc.io/"
license=('Apache')
_pkgname=grpcio
install=
changelog=
noextract=()
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/g/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "${_pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('9677172d34beb8d6ea35e0088e16cdaed9bc4d3bc65f9e34936d0f67ccc48fc9bae5cbc519bce4f1ac329f22ea824ef96ccf36325371ec4986fd9919ff3d8697'
            'SKIP')

package_python-grpcio() {
  depends=('python')
  optdepends=('python-grpcio-tools: Generate GRPC protobufs')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-grpcio() {
  depends=('python2')
  optdepends=('python2-grpcio-tools: Generate GRPC protobufs')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

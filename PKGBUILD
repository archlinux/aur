# Maintainer: Henri Chain <henri@henri-chain.com>
_pkgname=pbd
pkgname=python2-${_pkgname}
pkgver=0.9.r5.g5af39c7
pkgrel=1
pkgdesc='Protocol Buffers Disassembler'
arch=('any')
url="https://github.com/unusual-thoughts/${_pkgname}"
depends=('python' 'python2-protobuf')
license=('MIT')
source=("${pkgname}::git+https://github.com/unusual-thoughts/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${pkgname}/"
  python2 setup.py install --root="$pkgdir"
}


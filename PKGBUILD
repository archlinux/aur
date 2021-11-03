# Maintainer: Yigit Sever <yigit at yigitsever dot com>

pkgname=ouch-bin
_pkgname=${pkgname%-bin}
pkgver=0.3.1
pkgrel=1
pkgdesc="Painless compression and decompression in the terminal (binary release)"
arch=('x86_64')
url="https://github.com/ouch-org/ouch"
license=('MIT')
provides=(${_pkgname})
conflicts=(${_pkgname} ${_pkgname}-git)
source=("${_pkgname}::${url}/releases/download/${pkgver}/ouch-x86_64-linux-musl"
  "LICENSE::https://raw.githubusercontent.com/ouch-org/ouch/master/LICENSE")
sha256sums=('48843b18aee48273e60456267c408163d51df046ad79a6cdd99c75c45cb79afe'
  'f082ccc8a66b3fdbeb6d53d5fe084934fc6f480a9d1d9243d2c5d9e45ec76938')

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}

# Maintainer: Simon Hayessen <simon at lnqs dot io>

pkgname=python-obsws
_reponame=obsws-python
pkgver=1.7.1
_commit_hash=f52ac163b8bd295c11cf04e51039aadbc93ed678
pkgrel=1
pkgdesc="A Python SDK for OBS Studio WebSocket v5.0"
arch=(any)
url="https://github.com/aatikturk/obsws-python"
license=("GPL-3.0")
depends=("python" "python-tomli" "python-websocket-client")
makedepends=("python-setuptools")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${_commit_hash}.tar.gz")
sha256sums=("c58c0f0ee354a0626b410be473aa9bfb41011b5b3ed2ecbf22092e15023792ae")

package() {
  cd ${_reponame}-${_commit_hash}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}


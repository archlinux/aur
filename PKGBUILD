# Maintainer: Simon Hayessen <simon at lnqs dot io>

pkgname=python-obsws
_reponame=obsws-python
pkgver=1.7.0
_commit_hash=9402f2e472e018617e2c15179ea24cad355a5e0e
pkgrel=1
pkgdesc="A Python SDK for OBS Studio WebSocket v5.0"
arch=(any)
url="https://github.com/aatikturk/obsws-python"
license=("GPL-3.0")
depends=("python" "python-tomli" "python-websocket-client")
makedepends=("python-setuptools")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${_commit_hash}.tar.gz")
sha256sums=("0fc8e7a538f99f2271989f754f457a9f92f160b514f787f31c4096c76dbdee48")

package() {
  cd ${_reponame}-${_commit_hash}
  sed -i 's/license = \(.*\)/license = { text = \1 }/' pyproject.toml
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}


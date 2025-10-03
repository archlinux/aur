# Maintainer: Simon Hayessen <simon at lnqs dot io>

pkgname=python-obsws
_reponame=obsws-python
pkgver=1.8.0
_commit_hash=f70583d7ca250c1f3a0df768d3cfd41663a6023b
pkgrel=1
pkgdesc="A Python SDK for OBS Studio WebSocket v5.0"
arch=(any)
url="https://github.com/aatikturk/obsws-python"
license=("GPL-3.0")
depends=("python" "python-tomli" "python-websocket-client")
makedepends=("python-setuptools")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${_commit_hash}.tar.gz")
sha256sums=('34cfb51196825a0ec18ecd4d1744c29d51a11f17c89564dfbdf96911a5ebe1f4')

package() {
  cd ${_reponame}-${_commit_hash}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}


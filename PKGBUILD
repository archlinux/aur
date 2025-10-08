# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=python-biliass
_pypiname=biliass
pkgver=2.3.1
pkgrel=1
pkgdesc='将 B 站 XML/protobuf 弹幕转换为 ASS 弹幕'
arch=('any')
url='https://github.com/yutto-dev/yutto/tree/main/packages/biliass'
license=('GPL-3.0-only')
depends=()
makedepends=(python-build python-installer python-wheel python-maturin)
source=("https://pypi.io/packages/source/${_pypiname:0:1}/$_pypiname/$_pypiname-$pkgver.tar.gz")
sha256sums=('008e98107ec7d45ad787b6986605a62409cdd92083ed489ba0b6f2a20729539f')

build() {
    cd "$_pypiname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pypiname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

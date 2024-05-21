# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=python-biliass
_pypiname=biliass
pkgver=1.3.8
pkgrel=1
pkgdesc='将 B 站 XML/protobuf 弹幕转换为 ASS 弹幕'
arch=('any')
url='https://github.com/yutto-dev/biliass'
license=('GPL-3.0-only')
depends=('python-protobuf')
makedepends=(python-build python-installer python-wheel python-poetry-core)
source=("https://pypi.io/packages/source/${_pypiname:0:1}/$_pypiname/$_pypiname-$pkgver.tar.gz")
sha256sums=('4afc9b9af71c161584763582e45a51a4c22398551daf9a39c5e109866c5dabd3')

build() {
    cd "$_pypiname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pypiname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

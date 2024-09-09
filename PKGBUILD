# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=python-biliass
_pypiname=biliass
pkgver=1.3.12
pkgrel=1
pkgdesc='将 B 站 XML/protobuf 弹幕转换为 ASS 弹幕'
arch=('any')
url='https://github.com/yutto-dev/biliass'
license=('GPL-3.0-only')
depends=('python-protobuf')
makedepends=(python-build python-installer python-wheel python-poetry-core)
source=("https://pypi.io/packages/source/${_pypiname:0:1}/$_pypiname/$_pypiname-$pkgver.tar.gz")
sha256sums=('fb1ab9a96fbc94a6f8428ce9f80effff2e27894e77402d46ad42cf1257766d19')

build() {
    cd "$_pypiname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pypiname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=python-biliass
_pypiname=biliass
pkgver=1.3.4
pkgrel=4
pkgdesc='将 B 站 XML 弹幕转换为 ASS 弹幕'
arch=('any')
url='https://github.com/ShigureLab/biliass'
license=('GPL3')
depends=('python-protobuf')
makedepends=('python-setuptools' 'python-wheel')
source=("https://pypi.io/packages/source/${_pypiname:0:1}/$_pypiname/$_pypiname-$pkgver.tar.gz")
sha256sums=('924b4afbaacbc188641bb2e24c196005b88837c6a9c1e83897ca494938ca414e')

build() {
    cd "$_pypiname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pypiname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    rm -rf "$pkgdir/usr/lib/"*"/site-packages/tests" || true
}

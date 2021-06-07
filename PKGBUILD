# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=python-biliass
_pypiname=biliass
pkgver=1.3.3
pkgrel=1
pkgdesc='将 B 站 XML 弹幕转换为 ASS 弹幕'
arch=('any')
url='https://github.com/ShigureLab/biliass'
license=('GPL3')
depends=('python-protobuf')
makedepends=('python-setuptools' 'python-wheel')
source=("https://pypi.io/packages/source/${_pypiname:0:1}/$_pypiname/$_pypiname-$pkgver.tar.gz")
sha256sums=('be1f6440f907e97b429ed27194c3ec84563ac39040e4f8f8502d4c8b0055bca5')

build() {
    cd "$_pypiname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pypiname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

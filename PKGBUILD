# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=python-biliass
_pypiname=biliass
pkgver=1.3.7
pkgrel=2
pkgdesc='将 B 站 XML/protobuf 弹幕转换为 ASS 弹幕'
arch=('any')
url='https://github.com/yutto-dev/biliass'
license=('GPL3')
depends=('python-protobuf')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/${_pypiname:0:1}/$_pypiname/$_pypiname-$pkgver.tar.gz")
sha256sums=('3fb2b76edf0c5c3e87a09eddb90f651bdf728f4955c27f52a84102fd352e74ae')

build() {
    cd "$_pypiname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pypiname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=python-biliass
_pypiname=biliass
pkgver=1.3.5
pkgrel=2
pkgdesc='将 B 站 XML/protobuf 弹幕转换为 ASS 弹幕'
arch=('any')
url='https://github.com/yutto-dev/biliass'
license=('GPL3')
depends=('python-protobuf')
makedepends=('python-setuptools' 'python-wheel')
source=("https://pypi.io/packages/source/${_pypiname:0:1}/$_pypiname/$_pypiname-$pkgver.tar.gz")
sha256sums=('920a10517da5e5810d128cdc9df96ec2f7003b5652c657c73d521af40056e885')

build() {
    cd "$_pypiname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pypiname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    rm -rf "$pkgdir/usr/lib/"*"/site-packages/tests" || true
}

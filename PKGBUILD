# Maintainer: dringsim <dringsim@qq.com>

pkgname=python-danmakuc
_name="danmakuC"
pkgver=0.3.6
pkgrel=1
pkgdesc="Faster conversion for larger Danmaku to Ass format"
arch=(x86_64)
url="https://github.com/HFrost0/danmakuC"
license=('GPL-3.0-or-later')
makedepends=('python-setuptools' 'pybind11')
depends=('python-protobuf')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('db6b7dcf3dba1595c08a37a6f27f925fb40b9b8c110ff013872ac575c9c30132')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
	# install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


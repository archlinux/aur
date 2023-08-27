# Maintainer: Dringsim <dringsim@qq.com>

pkgname=python-aiomcache
_name="${pkgname#python-}"
pkgver=0.8.1
pkgrel=1
pkgdesc='Minimal pure python memcached client'
arch=('any')
url='https://github.com/aio-libs/aiomcache'
license=('custom:BSD-2-Clause')
depends=('python-typing_extensions')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ef7dede44ccb4bbe386ff4958c45c4a17e66476c801594489ba45408adb13b7b')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

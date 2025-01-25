# Maintainer: dringsim <dringsim@qq.com>

pkgname=python-aiomcache
_name="${pkgname#python-}"
pkgver=0.8.2
pkgrel=1
pkgdesc='Minimal pure python memcached client'
arch=('any')
url='https://github.com/aio-libs/aiomcache'
license=('custom:BSD-2-Clause')
depends=('python-typing_extensions')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('43b220d7f499a32a71871c4f457116eb23460fa216e69c1d32b81e3209e51359')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname="python-aioredis1"
pkgver=1.3.1
pkgrel=1
pkgdesc="asyncio (PEP 3156) Redis client library (legacy version)"
url="https://github.com/aio-libs/aioredis-py"
license=("MIT")
arch=("any")
provides=("python-aioredis=1.3.1")
conflicts=("python-aioredis")
depends=("python-async-timeout" "python-hiredis")
makedepends=("python-setuptools")
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('be5d4360443547b5cc4a7ea5753d4e60a8e079e41b44ba043060e822ab896000')

build(){
 cd "aioredis-py-$pkgver"
 python setup.py build
}

package(){
 cd "aioredis-py-$pkgver"
 python setup.py install --root="$pkgdir" --optimize=1
}

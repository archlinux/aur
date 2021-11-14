# Maintainer: MithicSpirit <rpc01234 at gmail dot com>

pkgname=python-pincer-git
pkgver=0.9.3.r477.g6849a6a
pkgrel=1
pkgdesc="The snappy asynchronous discord api wrapper API wrapper written with aiohttp & websockets."
arch=(any)
url="https://github.com/Pincer-org/Pincer" # https://pincer.dev/ (under construction)
license=('MIT')
depends=('python' 'python-aiohttp' 'python-websockets')
makedepends=('python-setuptools' 'git')
source=("${pkgname}::git+https://github.com/Pincer-org/Pincer.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	python setup.py build
}

package() {
	cd "$pkgname"
	python setup.py install --root="$pkgdir" --optimize=1
}

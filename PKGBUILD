# Maintainer: MithicSpirit <rpc01234 at gmail dot com>

pkgname=python-pincer-git
pkgver=latest
pkgrel=2
pkgdesc="The snappy asynchronous discord api wrapper API wrapper written with aiohttp."
arch=(any)
url="https://github.com/Pincer-org/Pincer" # https://pincer.dev/ (under construction)
license=('MIT')
depends=('python>=3.8' 'python-aiohttp')
optdepends=('python-pillow: image support'
			'python-orjson: speed'
			'python-brotli: speed'
			'python-aiodns: speed'
			'python-cchardet: speed')
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

# Maintainer: Ben Westover <kwestover.kw@gmail.com>
pkgname=python-py-cord
pkgver=2.0.1
pkgrel=1
pkgdesc="Pycord is a maintained fork of discord.py, a python wrapper for the Discord API"
arch=(any)
url="https://github.com/Pycord-Development/pycord"
license=('MIT')
depends=('python' 'python-aiohttp')
makedepends=('python-setuptools')
optdepends=('python-pynacl: Voice support'
            'libffi: Voice support')
conflicts=('python-discord')
provides=('python-discord' 'python-pycord')
source=("pycord-${pkgver}.tar.gz::https://github.com/Pycord-Development/pycord/archive/v${pkgver}.tar.gz")
sha256sums=('0404c38f7767699dba6097b56066d0a425bed89019e32348033f05067fbf9982')

build() {
	cd "$srcdir"/pycord-$pkgver
	python setup.py build
}

package() {
	cd "$srcdir"/pycord-$pkgver
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

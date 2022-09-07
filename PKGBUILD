# Maintainer: Ben Westover <kwestover.kw@gmail.com>
pkgname=python-py-cord
pkgver=2.1.3
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
sha256sums=('97ebbeb8d98862df15618b3a983308cd7c50933a54e87d4bff6420b30d34960d')

build() {
	cd "$srcdir"/pycord-$pkgver
	python setup.py build
}

package() {
	cd "$srcdir"/pycord-$pkgver
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

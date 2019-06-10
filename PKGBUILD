# Maintainer: Evgeniy Filimonov <evgfilim1@gmail.com>

pkgname='python-aiogram'
pkgver=2.2
pkgrel=1
pkgdesc="A pretty simple and fully asynchronous library for Telegram Bot API written in Python 3.7 with asyncio and aiohttp"
arch=('any')
url="https://github.com/aiogram/aiogram"
license=('MIT')
depends=('python>=3.7' 'python-aiohttp>=3.5.4' 'python-babel>=2.6.0' 'python-certifi>=2019.3.9')
makedepends=('python-setuptools')
#makedepends=('python-setuptools' 'python-pip')
optdepends=('python-uvloop: fast, drop-in replacement of the built-in asyncio event loop'
            'python-ujson: ultra fast JSON encoder and decoder written in pure C')
source=("https://github.com/aiogram/aiogram/archive/v${pkgver}.tar.gz")
sha256sums=('5bd01e03e6286c6b1e7c4fa37053441c2b576b8add221b8cbebd2a40e34c1937')

build() {
	cd "$srcdir/aiogram-${pkgver}"
	python setup.py build
}

package() {
	cd "$srcdir/aiogram-${pkgver}"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

# vim: ft=sh ts=4 sw=4 et 


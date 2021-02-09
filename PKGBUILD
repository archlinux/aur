# Maintainer: Evgeniy Filimonov <evgfilim1 at gmail dot com>

_pyname='aiogram'
pkgname="python-${_pyname}3"
pkgver=3.0.0a6
pkgrel=1
pkgdesc="A pretty simple and fully asynchronous library for Telegram Bot API written with asyncio and aiohttp (experimental version)"
arch=('any')
url="https://github.com/${_pyname}/${_pyname}"
license=('MIT')
depends=(
    'python>=3.7'
    'python-aiohttp>=3.6'
    'python-pydantic>=1.5'
    'python-babel>=2.7'
    'python-aiofiles>=0.4.0'
    'python-async_lru>=1.0'
)
makedepends=(
    'python-setuptools'
)
optdepends=(
    'python-uvloop: fast, drop-in replacement of the built-in asyncio event loop'
    'python-ujson: ultra fast JSON encoder and decoder written in pure C'
    'python-aiohttp-socks: SOCKS4(a) and SOCKS5 proxy support'
)
source=("https://dev-docs.aiogram.dev/simple/aiogram/${_pyname}-${pkgver}.tar.gz")
sha256sums=('0135e9b738674606542d409a5815f7ba6e711260da896c165c90dfc1f8dea081')
provides=('python-aiogram')
conflicts=('python-aiogram' 'python-aiogram-git')

build() {
    cd "$srcdir/${_pyname}-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/${_pyname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

# vim: ft=sh ts=4 sw=4 et 

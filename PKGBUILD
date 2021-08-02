# Maintainer: Evgeniy Filimonov <evgfilim1 at gmail dot com>

_pyname='aiogram'
pkgname="python-${_pyname}3"
pkgver=3.0.0a12
pkgrel=1
pkgdesc="Modern and fully asynchronous framework for Telegram Bot API (experimental version)"
arch=('any')
url="https://github.com/${_pyname}/${_pyname}"
license=('MIT')
depends=(
    'python>=3.8.0'
    'python-aiohttp>=3.7.4'
    'python-pydantic>=1.8.1'
    'python-babel>=2.9.1'
    'python-aiofiles>=0.6.0'
    'python-async_lru>=1.0.2'
    'python-magic-filter>=1.0.0'
)
makedepends=(
    'python-setuptools'
)
optdepends=(
    'python-uvloop: fast, drop-in replacement of the built-in asyncio event loop'
    'python-aiohttp-socks: SOCKS4(a) and SOCKS5 proxy support'
    'python-aioredis: Redis storage support'
)
source=("https://pypi.python.org/packages/source/${_pyname::1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('84f10eb89639691084c814a3f1f55d6ed15d438d43393084b611d6e582d02394')
provides=("python-${_pyname}")
conflicts=("python-${_pyname}" "python-${_pyname}3")

build() {
    cd "$srcdir/${_pyname}-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/${_pyname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

# vim: ft=sh ts=4 sw=4 et 

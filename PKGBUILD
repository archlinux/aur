# Maintainer: Evgeniy Filimonov <evgfilim1 at gmail dot com>

_pyname='aiogram'
pkgname="python-${_pyname}3"
pkgver=3.0.0a8
pkgrel=1
pkgdesc="Modern and fully asynchronous framework for Telegram Bot API (experimental version)"
arch=('any')
url="https://github.com/${_pyname}/${_pyname}"
license=('MIT')
depends=(
    'python>=3.7'
    'python-aiohttp>=3.7.4'        'python-aiohttp<4.0'
    'python-pydantic>=1.8.1'       'python-pydantic<2.0'
    'python-babel>=2.9.1'          'python-babel<3.0'
    'python-aiofiles>=0.6.0'       'python-aiofiles<0.7.0'
    'python-async_lru>=1.0.2'      'python-async_lru<1.1.0'
    'python-magic-filter>=1.0.0a1' 'python-magic-filter<1.1.0'
)
makedepends=(
    'python-setuptools'
)
optdepends=(
    'python-uvloop: fast, drop-in replacement of the built-in asyncio event loop'
    'python-aiohttp-socks: SOCKS4(a) and SOCKS5 proxy support'
)
source=("https://test-files.pythonhosted.org/packages/18/08/bc99e08bb53eafb4baedad7f45f8937afe9176f53a975b2e05673edde5cb/${_pyname}-${pkgver}.tar.gz")
sha256sums=('765dec68dd3fc7776101e7428a3ef307f2982c4acd912c43d125689d73425990')
provides=("python-${_pyname}")
conflicts=("python-${_pyname}" "python-${_pyname}-git" "python-${_pyname}3-git")

build() {
    cd "$srcdir/${_pyname}-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/${_pyname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

# vim: ft=sh ts=4 sw=4 et 

# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Philipp A. <flying-sheep@web.de>

_pkgname=aiohttp
pkgname=python-aiohttp-135
pkgver=1.3.5
pkgrel=1
pkgdesc='HTTP client/server for asyncio'
url='https://aiohttp.readthedocs.io'
arch=('i686' 'x86_64')
license=('Apache')
depends=('python>=3.4.2' 'python-chardet' 'python-multidict' 'python-async-timeout' 'python-yarl')
makedepends=('cython' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-mock')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/aio-libs/aiohttp/archive/${pkgver}.tar.gz)
sha256sums=('b6eec50d9ed64d3bf28a778a2fec44e314eb94ae9de0968c66081c85f42d1e22')
sha512sums=('5315d8c77d6886486274fb8f2e3f10cb8f97050b097560e5b1cfd51b4d094dc45281cad894ea51079c6b7054f396d46b89f4c471835d1b058dcc90faaf01eaa4')
replaces=('python-aiohttp')
conflicts=('python-aiohttp')
provides=('python-aiohttp')

prepare() {
  sed -i 's/yarl>=0.9.8,<0.10/yarl>=0.10.2,<0.11.0/g' ${srcdir}/${_pkgname}-${pkgver}/setup.py
}


build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}" -O1 --skip-build
}

# vim: ts=2 sw=2 et:

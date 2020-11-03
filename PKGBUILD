# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=aiohttp-debugtoolbar
pkgname="python-${_pkgname}"
pkgver=0.6.0
pkgrel=1
pkgdesc="debugtoolbar for aiohttp"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('Apache 2')
depends=('python' 'python-aiohttp' 'python-aiohttp-jinja2')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('ec231661133b40136608d39dfb688e7ea0c3d47b6ae6dee52d5bf24ceb9e4d45')
b2sums=('2dd5706670a3e5b2ee04c8e039ea419d9b08cef2e923d832dc9e54d6d3df5d42f0c0ae873b75ab1c48d299cf57564050443d6a66db4f2de0c61e47e2ffb7dfa9')

build() {
  cd "${_pkgname}-${pkgver}"

  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

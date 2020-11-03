# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=aiohttp-mako
pkgname="python-${_pkgname}"
pkgver=0.4.0
pkgrel=1
pkgdesc="mako template renderer for aiohttp.web (http server for asyncio)"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('Apache 2')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('f10bdee54589b6567e8a0339db582276fdaaa198764541d2f9741f1d3836312c')
b2sums=('56889665316624c022d4a66b3286ca18057e85a64acff478df6993b3fbc7e19eed8683841454abd39d5d55b79bdf30ec708defa3711fee0fa26490ed99ff32db')

build() {
  cd "${_pkgname}-${pkgver}"

  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

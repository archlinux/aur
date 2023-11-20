# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=aiohttp-debugtoolbar
pkgname="python-${_pkgname}"
pkgver=0.6.1
pkgrel=1
pkgdesc="debugtoolbar for aiohttp"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('Apache')
depends=('python' 'python-aiohttp' 'python-aiohttp-jinja2')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('cd7ae54c600db7ae7d9dc3404b81f95209a6367df1d59e13ea20f9926e36e001')
b2sums=('5f8b549f6c07147da93f719a8bffb67592b7dd37a782135ec8356d5bd7f4e21d4f9fbc8df4506980e5fe884e446dfbcb19a7c9fa7301677ff89c41686b88f629')

build() {
  cd "${_pkgname}-${pkgver}"

  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

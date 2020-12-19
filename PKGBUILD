# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=autokernel
pkgname="python-${_pkgname}"
pkgver=0.9.6
pkgrel=1
pkgdesc="A tool to autodetect and manage kernel configuration options"
arch=('any')
url="https://autokernel.oddlama.org/"
license=('MIT')
depends=('python'
         'python-kconfiglib' 'python-lark-parser' 'python-dateutil'
         'python-requests' 'python-sympy')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/oddlama/autokernel/archive/v${pkgver}.tar.gz")
sha256sums=('2041696daf430973c6432dcbc69fdd058d68f8bc3b3983e505c88cd41d8d6759')
b2sums=('eed32796a8d0521076d65602d1edab4d52f1b08d7095589947bca6156f7b14c8363cffa7e818eeb8d203794df13cf84294d912b1d61b114553475a307147a4f7')

build() {
  cd "${_pkgname}-${pkgver}"

  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

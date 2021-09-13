# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=python-pyld
_pkgname='pyld'
pkgver=2.0.3
pkgrel=1
pkgdesc="JSON-LD processor written in Python"
arch=('any')
url="https://github.com/digitalbazaar/pyld"
license=('BSD')
depends=('python-setuptools')
source=(https://github.com/digitalbazaar/${_pkgname}/archive/${pkgver}.tar.gz)
sha512sums=('ec12274cf7b6b6842c054e7c78a74a36d60496377d329c821a930dcf2000a02f24b77263d20086cdd83d28c1be37ab0b0c785026c7b3bf44cc1a42597410e769')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  python3 setup.py install --root="${pkgdir}" -O1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

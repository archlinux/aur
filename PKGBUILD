# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='emborg'
pkgver=1.23
pkgrel=2
pkgdesc="Front-end to Borg backup"
arch=('any')
depends=('borg' 'python-appdirs' 'python-arrow' 'python-docopt'  'python-inform' 'python-quantiphy' 'python-shlib' 'python-requests')
makedepends=('python-setuptools')
url="https://github.com/KenKundert/${pkgname}"
license=('GPL3')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('15efd5413a13baef5a0c7b1787e23dad0b97b59ae3e4e44c24252292eb03055a')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

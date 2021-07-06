# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='emborg'
pkgver=1.24
pkgrel=1
pkgdesc="Front-end to Borg backup"
arch=('any')
depends=('borg' 'python-appdirs' 'python-arrow' 'python-docopt'  'python-inform' 'python-quantiphy' 'python-shlib' 'python-requests')
makedepends=('python-setuptools')
url="https://github.com/KenKundert/${pkgname}"
license=('GPL3')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('02c4332a932ef7a97a60dc4e622e65a612e95bb468c47c24f349a5d2e1b792a5')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

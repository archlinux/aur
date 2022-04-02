# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='emborg'
pkgver=1.32
pkgrel=1
pkgdesc="Front-end to Borg backup"
arch=('any')
depends=('borg' 'python-appdirs' 'python-arrow' 'python-docopt'  'python-inform' 'python-quantiphy' 'python-shlib' 'python-requests')
makedepends=('python-setuptools')
url="https://github.com/KenKundert/${pkgname}"
license=('GPL3')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('fec1203c5737dd8c4416b66b0565153f3e280435273ca41fab217f986077f4b0')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

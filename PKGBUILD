# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=socli
pkgver=5.9
pkgrel=1
pkgdesc="Stack overflow command line client. Search and browse stack overflow without leaving the terminal"
arch=('any')
url='https://github.com/gautamkrishnar/socli'
license=('BSD')
depends=('python-beautifulsoup4'
         'python-requests'
         'python-colorama'
         'python-py-stackexchange'
         'python-urwid')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gautamkrishnar/socli/archive/${pkgver}.tar.gz")
sha256sums=('9947e33608b54f5086b557e739bd6ad67411f2c957aaf1ba55cb75b4dfcde45a')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  cd "${pkgdir}/usr/"
  mv man share
}

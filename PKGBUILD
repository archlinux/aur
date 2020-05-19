# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=socli
pkgver=3.9
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
sha256sums=('73140048112d099350ad48d8d92de606b26883bb26be9efc64113a437afbb45d')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
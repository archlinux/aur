# Maintainer: Pranay Kanwar <pranay dot kanwar at gmail dot com>
# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=socli
pkgver=7.0
pkgrel=1
pkgdesc="Stack overflow command line client. Search and browse stack overflow without leaving the terminal"
arch=('any')
url='https://github.com/gautamkrishnar/socli'
license=('BSD')
depends=('python-argcomplete'
         'python-beautifulsoup4'
         'python-requests'
         'python-colorama'
         'python-py-stackexchange'
         'python-sentry_sdk'
         'python-urwid')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gautamkrishnar/socli/archive/${pkgver}.tar.gz")
sha256sums=('2b86e884193af21c950883159d14f57a46013d7dec45ede8d1266338209b178e')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  cd "${pkgdir}/usr/"
  mv man share
}

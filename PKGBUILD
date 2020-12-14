# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=socli
pkgver=6.0
pkgrel=1
pkgdesc="Stack overflow command line client. Search and browse stack overflow without leaving the terminal"
arch=('any')
url='https://github.com/gautamkrishnar/socli'
license=('BSD')
depends=('python-beautifulsoup4'
         'python-requests'
         'python-colorama'
         'python-py-stackexchange'
         'python-sentry_sdk'
         'python-urwid')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gautamkrishnar/socli/archive/${pkgver}.tar.gz")
sha256sums=('947d2938b7ee2bc8a03b15f7c4af4a050f7ce56fc09835a6eaa425503c1c065f')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  cd "${pkgdir}/usr/"
  mv man share
}

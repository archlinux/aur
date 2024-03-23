# Maintainer: Pranay Kanwar <pranay dot kanwar at gmail dot com>
# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=socli
pkgver=7.4
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
optdepends=('python-pyperclip: Copy answer text to clipboard')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gautamkrishnar/socli/archive/${pkgver}.tar.gz")
sha256sums=('63f73e7b1308df6eab21c730892643dc891379168b9508f627222983db13a81b')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  cd "${pkgdir}/usr/"
  mv man share
}

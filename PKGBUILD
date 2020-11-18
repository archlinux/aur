# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-akshare
pkgver=0.7.17
pkgrel=1
pkgdesc="AkShare is an elegant and simple financial data interface library for Python, built for human beings"
arch=('any')
url='https://www.akshare.xyz'
license=('MIT')
provides=('akshare')
depends=('python-beautifulsoup4'
         'python-lxml'
         'python-matplotlib'
         'python-numpy'
         'python-pandas'
         'python-requests'
         'python-urllib3'
         'python-demjson'
         'python-pillow'
         'python-pinyin'
         'python-websocket-client'
         'python-html5lib'
         'python-xlrd'
         'python-tqdm'
         'python-openpyxl'
         'python-jsonpath-ng'
         'python-tabulate'
         'python-decorator'
         'python-pyminiracer')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jindaxiang/akshare/archive/v${pkgver}.tar.gz")
sha256sums=('3b89c798c5ced054b895671205c416b992fb500f86fd043daa58ee4c57719b63')

build() {
  cd ${srcdir}/akshare-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/akshare-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

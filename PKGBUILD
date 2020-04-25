# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-akshare
pkgver=0.4.90
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
		 'python-pyexecjs'
		 'python-pillow'
		 'python-pinyin'
		 'python-websocket-client'
		 'python-pycryptodomex'
		 'python-html5lib'
		 'python-requests-html'
		 'python-scikit-learn'
		 'python-fonttools'
		 'python-xlrd'
		 'python-tqdm'
		 'python-openpyxl'
		 'python-jsonpath-ng'
		 'python-tabulate'
		 'python-decorator')
makedepends=('python-setuptools')
source=("https://github.com/jindaxiang/akshare/archive/v${pkgver}.tar.gz")
sha256sums=('40e22de67f920d6dddc79056011ee6c89cdf23dedd1c497e2fb2aab1419e6515')

build() {
  cd ${srcdir}/akshare-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/akshare-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
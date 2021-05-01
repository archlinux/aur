# Maintainer:  Louise Zanier

pkgname=woob
pkgver=3.0
pkgrel=1
pkgdesc="Core library and modules for Web Outside of Browsers"
arch=(any)
url="https://woob.tech"
license=('LGPL3')
depends=('python-lxml'
         'python-cssselect'
         'python-requests'
         'python-dateutil'
         'python-yaml'
         'python-html2text'
         'python-six'
         'python-unidecode'
         'python-pillow'
         'python-babel'
         'python-simplejson')
optdepends=('python-prettytable: CLI output formatting'
        'python-feedparser: required by some modules')
makedepends=('python-setuptools')
replaces=('weboob-headless' 'weboob')
provides=('weboob-headless' 'weboob')
conflicts=('weboob-headless' 'weboob')
source=("https://gitlab.com/woob/woob/-/archive/${pkgver}/woob-${pkgver}.tar.gz")
sha256sums=('bed50a498d6b99b4405b6e28a5ffcaf55170e86bb80c680fb6c70e749c63e859')

build() {
  cd "${srcdir}/woob-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/woob-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --skip-build --optimize=1
}

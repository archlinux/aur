# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python2-cdecimal
pkgver=2.3
pkgrel=1
pkgdesc="Fast drop-in replacement for decimal.py"
arch=('i686' 'x86_64')
url="http://www.bytereef.org/mpdecimal/index.html"
depends=('python2')
makedepends=('python2-setuptools')
license=('BSD')
options=(!libtool)
source=(http://www.bytereef.org/software/mpdecimal/releases/cdecimal-${pkgver}.tar.gz)
md5sums=('655f9fd72f7a21688f903900ebea6f56')

build() {
  cd "${srcdir}"/cdecimal-${pkgver}

  python2 setup.py build
}

package() {
  cd "${srcdir}"/cdecimal-${pkgver}

  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1

  install -D LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


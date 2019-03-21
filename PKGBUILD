pkgname=python-wakeonlan
pkgver=1.1.6
pkgrel=1
pkgdesc="A small python module for wake on lan"
url="https://github.com/remcohaszing/pywakeonlan"
arch=(any)
license=('WTFPL')
makedepends=('python-setuptools')
depends=('python')
source=("https://pypi.io/packages/source/w/wakeonlan/wakeonlan-${pkgver}.tar.gz")
sha256sums=('5e6013a17004809e676c150689abd94bcc0f12a37ad3fbce1f6270968f95ffa9')

prepare() {
  cd "${srcdir}"/wakeonlan-$pkgver
}

build() {
  cd "${srcdir}"/wakeonlan-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}/wakeonlan-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}



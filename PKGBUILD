# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=you-get
pkgver=0.4.236
pkgrel=1
pkgdesc="A YouTube/Youku/Niconico video downloader written in Python 3."
url="http://www.soimort.org/you-get/"
arch=('any')
license=('MIT')
depends=('python-setuptools')
makedepends=('git')
source=("git+https://github.com/soimort/you-get.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "${srcdir}"/${pkgname}
  python setup.py build
}

check() {
  cd "${srcdir}"/${pkgname}
  LC_CTYPE=en_US.UTF-8 python setup.py test
}

package() {
  cd "${srcdir}"/${pkgname}
  python setup.py install --root="$pkgdir"

  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

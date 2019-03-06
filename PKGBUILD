# Maintainer: arkhan <arkhan@disroot.org>
pkgname=format-sql
pkgver=0.12.0
pkgrel=1
pkgdesc="Makes your SQL readable."
arch=('any')
license=('BSD')
depends=("python" "python-attrs")
makedepends=("python")
conflicts=("python-${_pkgname}-git")
url='https://github.com/paetzke/format-sql'
source=("https://github.com/paetzke/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('65fde3b80da1bd4063e2196676620535')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root "${pkgdir}" || return 1
}

# vim:set ts=2 sw=2 et:

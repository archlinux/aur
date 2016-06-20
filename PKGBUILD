# Maintainer: Hexchain Tong <i@hexchain.org>

pkgname=coursera-dl
pkgver=0.6.1
pkgrel=1
pkgdesc="Script for downloading Coursera.org videos and naming them"
arch=('any')
url="https://github.com/coursera-dl/coursera-dl/"
license=('LGPL3')
depends=('python' 'python-pyasn1' 'python-html5lib' 'python-beautifulsoup4' 'python-setuptools' 'python-requests' 'python-six' 'python-keyring')
makedepends=('git' 'pandoc')
source=("git://github.com/coursera-dl/coursera-dl.git#tag=$pkgver")
sha256sums=('SKIP')

prepare() {
  export LC_CTYPE="en_US.UTF-8"
}

package() {
  cd "$srcdir/$pkgname"
  python ./setup.py install -O1 --root="$pkgdir"
  install -Dm755 coursera-dl "$pkgdir/usr/bin/coursera-dl"
}

# vim: set ts=2 sw=2 et:

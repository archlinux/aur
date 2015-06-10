# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=c2go-git
pkgver=0.1.r0.g9ad7755
pkgrel=1
pkgdesc='C to Go conversion helper'
arch=('any')
url='http://github.com/xyproto/c2go'
license=('BSD')
depends=('python-pycparser')
source=('c2go::git://github.com/xyproto/c2go')
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"

  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "${pkgname%-git}"

  install -Dm755 c2go.py "$pkgdir/usr/bin/c2go"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

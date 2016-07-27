# Maintainer: Quint Guvernator <quint@guvernator.net>

_pkgname=w3
pkgname="$_pkgname-git"
pkgver=0.1.0.r0.g72da041
pkgrel=1
pkgdesc='w3: the wee weechat wrapper'
arch=('any')
url='https://github.com/qguv/w3'
license=('GPL')
depends=('sudo' 'less')
makedepends=('git' 'weechat' 'python')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/qguv/w3")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dt "$pkgdir/usr/bin/" w3
}

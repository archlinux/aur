# Maintainer: TheAifam5 <theaifam5 at gmail com>

pkgname=sol2-git
pkgver=v3.0.2.r1.ge256012d
pkgrel=1
pkgdesc="C++ <-> Lua Wrapper Library"
arch=('any')
url="http://sol2.rtfd.io/"
license=('MIT')
makedepends=('git')
optdepends=('lua' 'lua51' 'lua52' 'luajit')
conflicts=('sol2')
provides=('sol2')
source=('sol2::git+https://github.com/ThePhD/sol2.git')
md5sums=('SKIP')

pkgver() {
  cd sol2
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd sol2
  install -d $pkgdir/usr/include
  cp -rf ./include $pkgdir/usr
}

# Maintainer: TheAifam5 <theaifam5 at gmail com>

pkgbase=sol2
pkgname=(sol2-git sol2-single-git)
pkgver=v3.0.2.r1.ge256012d
pkgrel=2
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

package_sol2-git() {
  cd sol2

  install -d $pkgdir/usr/include
  cp -rf ./include $pkgdir/usr
}

package_sol2-single-git() {
  makedepends+=('python')
  
  cd sol2/single

  install -d $pkgdir/usr/include
  python single.py --input ../include --output $pkgdir/usr/include/sol/sol.hpp
}

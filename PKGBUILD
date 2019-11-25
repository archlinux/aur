# Maintainer: TheAifam5 <theaifam5 at gmail com>

pkgbase=sol2-git
pkgname=(sol2-git sol2-single-git)
pkgver=v3.0.3.r38.g21c03093
pkgrel=1
pkgdesc="C++ <-> Lua Wrapper Library"
arch=('any')
url="http://sol2.rtfd.io/"
license=('MIT')
makedepends=('git' 'python')
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

  install -d $pkgdir/usr/include/sol
  cp -rf ./include $pkgdir/usr
}

package_sol2-single-git() {
  cd sol2/single

  install -d $pkgdir/usr/include/sol
  python single.py --input ../include --output $pkgdir/usr/include/sol/sol.hpp
}

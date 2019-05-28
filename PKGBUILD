# Maintainer: TheAifam5 <theaifam5 at gmail com>

_pkgver=3.0.2
pkgbase=sol2
pkgname=(sol2 sol2-single)
pkgver=v${_pkgver}
pkgrel=3
pkgdesc="C++ <-> Lua Wrapper Library"
arch=('any')
options=(!strip)
url="http://sol2.rtfd.io/"
license=('MIT')
makedepends=('git')
optdepends=('lua' 'lua51' 'lua52' 'luajit')
conflicts=('sol2')
provides=('sol2')
source=("https://github.com/ThePhD/sol2/archive/$pkgver.tar.gz")
sha256sums=('6265ade1efd5b1133d71fa3b81fd0214ccf964992a8cbab3dfae650a00ed0258')

package_sol2() {
  cd "./$pkgbase-$_pkgver"

  install -d $pkgdir/usr/include
  cp -rf ./include $pkgdir/usr
}

package_sol2-single() {
  makedepends+=('python')

  cd "./$pkgbase-$_pkgver/single"

  install -d $pkgdir/usr/include
  
  python single.py --input ../include --output $pkgdir/usr/include/sol/sol.hpp
}


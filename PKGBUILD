# Maintainer: TheAifam5 <theaifam5 at gmail com>

pkgbase=sol2
pkgname=(sol2 sol2-single)
pkgver=3.2.1
pkgrel=1
pkgdesc="C++ <-> Lua Wrapper Library"
arch=('any')
options=(!strip)
url="http://sol2.rtfd.io/"
license=('MIT')
makedepends=('git' 'python')
optdepends=('lua' 'lua51' 'lua53' 'lua52' 'luajit')
conflicts=('sol2')
provides=('sol2')
source=("https://github.com/ThePhD/sol2/archive/v$pkgver.tar.gz")
sha256sums=('b10f88dc1246f74a10348faef7d2c06e2784693307df74dcd87c4641cf6a6828')

package_sol2() {
  cd "./$pkgbase-$pkgver"

  install -d $pkgdir/usr/include/sol
  cp -rf ./include $pkgdir/usr
}

package_sol2-single() {
  cd "./$pkgbase-$pkgver/single"

  install -d $pkgdir/usr/include/sol
  
  python single.py --input ../include --output $pkgdir/usr/include/sol/sol.hpp
}


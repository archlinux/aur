# Maintainer: Viste <viste02@gmail.com> 

_pkgname='azeroth-core'
__pkgname='azerothcore-wotlk'
pkgname="${_pkgname}-git"
pkgver=3.0.0
pkgrel=4
pkgdesc="AzerothCore - MMORPG Server. Based on MaNGOS -> TrinityCore -> SunwellCore"
url="http://www.azerothcore.org"
license=('AGPL3')
arch=('any')
depends=('cmake' 'libmysqlclient57' 'clang' 'readline' 'lib32-readline' 'ace')
source=("git+https://github.com/azerothcore/${__pkgname}.git")
sha512sums=('SKIP')

package() {
  cd "${__pkgname}"
  mkdir build && cd build
  cmake ../ -DCMAKE_INSTALL_PREFIX=$HOME/azeroth-server/ -DCMAKE_C_COMPILER=/usr/bin/clang -DCMAKE_CXX_COMPILER=/usr/bin/clang++ -DTOOLS=0 -DSCRIPTS=1 -DWITH_WARNINGS=1 -DCMAKE_C_FLAGS="-Werror" -DCMAKE_CXX_FLAGS="-Werror"
  make -j 4
  make install
}

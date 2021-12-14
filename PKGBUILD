# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: TheAifam5 <theaifam5 at gmail com>
pkgbase=sol2
pkgname=(sol2 sol2-single)
pkgver=3.2.3
pkgrel=2
pkgdesc="C++ <-> Lua API wrapper with advanced features and top notch performance"
arch=('any')
options=(!strip)
url="https://sol2.rtfd.io"
license=(MIT)
makedepends=(python git)
optdepends=(lua lua51 lua53 lua52 luajit)
conflicts=(sol2)
provides=(sol2)
source=(https://github.com/ThePhD/${pkgbase}/archive/v${pkgver}.tar.gz)
sha512sums=('448be11555725ddce5ea8d56d793da529c1bb969a4f444ad840044c49a047a5af2abe96d7bf17763246a397eddb4a34e6d299adb14ad3f30f6193f631f27c239')

package_sol2() {
  cd "${pkgbase}-${pkgver}"

  install -d ${pkgdir}/usr/include/sol
  cp -rf ./include ${pkgdir}/usr
}

package_sol2-single() {
  cd "${pkgbase}-${pkgver}/single"

  install -d ${pkgdir}/usr/include/sol

  python single.py --input ../include --output ${pkgdir}/usr/include/sol/sol.hpp
}

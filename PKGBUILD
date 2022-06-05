# Maintainer: Hristo Tanev <hristo.tanev@outlook.com>
pkgname=devsak-git
pkgver=0.0.1.r1.g556ba9e
pkgrel=1
pkgdesc="DEVeloper's Swiss Army Knife"
arch=(any)
url="https://github.com/hristotanev/devsak.git"
license=('MIT')
makedepends=(git)
provides=(devsak)
conflicts=(devsak)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd devsak
  git describe --long --tags | sed -e 's/v//' | sed -e 's/^DEVSAK_//;s/\([^-]*-g\)/r\1/;s/_/./g;s/-/./g'
}

package() {
  cd devsak
  mkdir -p ${pkgdir}/opt/${pkgname}
  cp -rf * ${pkgdir}/opt/${pkgname}
  install -Dm755 ${pkgdir}/opt/${pkgname}/scripts/devsak.sh ${pkgdir}/usr/bin/devsak
  install -Dm755 ${pkgdir}/opt/${pkgname}/scripts/uninstall.sh ${pkgdir}/usr/bin/uninstall_devsak
}

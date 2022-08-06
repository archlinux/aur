# Contributor: demian <mikar ατ gmx δοτ de>
_commit=6b2000d4bddc7a0008ba347cdb084391cbe9bf73
pkgname=thinkwatt
pkgver=0.3.r36.6b2000d
pkgrel=1
pkgdesc="record power consumption, calculate the average and create a gnuplot graphic"
arch=('any')
url="https://github.com/serialoverflow/thinkwatt"
license=('MIT')
depends=("gnuplot")
optdepends=("tp_smapi")
makedepends=("git")
source=("git+${url}#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
  # old maintainer/developer used pkgver=0.3 so we honor that
  printf "0.3.r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

package() {
  cd ${pkgname}
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  install -Dm755 -t "${pkgdir}/usr/bin" ${pkgname}
}

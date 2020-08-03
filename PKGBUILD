# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=opencs-bin
pkgver=1.1.0
pkgrel=1
pkgdesc='A framework for equation-based modelling (large scale ODE/DAE systems), parallel evaluation of model equations, parallel simulations on shared and distributed memory systems'
arch=('x86_64')
url="http://www.daetools.com/opencs.html"
license=('LGPL3')
provides=('opencs')
depends=('gcc-libs')
source=("${pkgname%-bin}-${pkgver}.zip::https://sourceforge.net/projects/daetools/files/OpenCS/OpenCS-${pkgver}.zip/download")
sha256sums=('73e286ba6ce0246e3482f96b202d0671a1a2fd1c11cbc8d8b7b5658b8a87f438')

package() {
  cd "OpenCS-${pkgver}"
  install -d "${pkgdir}/usr" \
    "${pkgdir}/usr/share/doc/${pkgname%-bin}/"
  cp -avR binary-gnu_linux64/lib "${pkgdir}/usr/"
  cp -avR binary-gnu_linux64/bin "${pkgdir}/usr/"
  cp -avR binary-gnu_linux64/include "${pkgdir}/usr/"
  install -Dm644 docs/opencs-overview.pdf -t "${pkgdir}/usr/share/doc/${pkgname%-bin}/"
}
# vim:set ts=2 sw=2 et:
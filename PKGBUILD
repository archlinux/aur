# Maintainer: annguyenfoss <an@linux.vn>
pkgname=kaufman
pkgver=0.1
pkgrel=1
pkgdesc="Clean caches and temporary files from a Linux system - Early beta stage"
arch=('any')
url="https://github.com/adjutant/${pkgname}"
license=('GPL3')
depends=('bash' 'coreutils')
makedepends=('git')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/annguyenfoss/${pkgname}/archive/${pkgver}.tar.gz) 
sha256sums=('38600f8e201172f4446ff29d3ec2e3d9d173c2bcbe67c116e76c0a745a4db091')

package() {
  cd "${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/bin/"  "${pkgdir}/etc/${pkgname}/"
  install -Dm755 src/${pkgname} "${pkgdir}/usr/bin/"
  install -Dm644 conf/${pkgname}-targets "${pkgdir}/etc/${pkgname}/targets"
}


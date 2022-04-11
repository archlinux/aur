# Maintainer: Jean-Marc Lenoir <archlinux "at" jihemel "dot" com>

pkgname=mg-lru-helper
pkgver=0.3.0
pkgrel=1
pkgdesc="Enable or disable multigenerational LRU"
arch=('any')
license=('custom')
url='https://github.com/hakavlad/mg-lru-helper'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c0364495edd8336a2ff207cd707d03b75c916afbdbd1e80e3bd2eeba2058357d')

package() {
  cd "${pkgname}-${pkgver}"
  
  make DESTDIR=\""${pkgdir}"\" BINDIR=/usr/bin SYSTEMDUNITDIR=/usr/lib/systemd/system install
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

# Maintainer: aps42 <arch@andre-sterba.de>
pkgname=containerlab-bin
pkgver=0.35.0
pkgrel=2
pkgdesc='containerlab enables container-based networking labs'
arch=('x86_64')
provides=(containerlab)
url='https://github.com/srl-labs/containerlab'
license=('BSD')

source=("${pkgname/-bin/}-${pkgver}.tar.gz::https://github.com/srl-labs/containerlab/releases/download/v${pkgver}/containerlab_${pkgver}_Linux_amd64.tar.gz")

sha256sums=('cdfd33695d7aed6abe88a27703d1a8f7e41f060a4e1128c2fbb14df32eaa0ff4')

package() {
  install -Dm755 ${pkgname/-bin/} "$pkgdir"/usr/bin/${pkgname/-bin/}

  install -d "${pkgdir}/etc/${pkgname/-bin/}/templates"
  install -d "${pkgdir}/etc/${pkgname/-bin/}/lab-examples"

  cp -r "${srcdir}/templates/"* "$pkgdir/etc/${pkgname/-bin/}/templates"
  cp -r "${srcdir}/lab-examples/"* "$pkgdir/etc/${pkgname/-bin/}/lab-examples"
}


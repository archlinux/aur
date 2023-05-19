# Maintainer: aps42 <arch@andre-sterba.de>
pkgname=containerlab-bin
pkgver=0.41.2
pkgrel=1
pkgdesc='containerlab enables container-based networking labs'
arch=('x86_64')
provides=(containerlab)
url='https://github.com/srl-labs/containerlab'
license=('BSD')

source=("${pkgname/-bin/}-${pkgver}.tar.gz::https://github.com/srl-labs/containerlab/releases/download/v${pkgver}/containerlab_${pkgver}_Linux_amd64.tar.gz")

sha256sums=('5b966253d95810b5a367ffe740293a39540aae83e5b382359af43a852a4ca287')

package() {
  install -Dm755 ${pkgname/-bin/} "$pkgdir"/usr/bin/${pkgname/-bin/}

  install -d "${pkgdir}/etc/${pkgname/-bin/}/templates"
  install -d "${pkgdir}/etc/${pkgname/-bin/}/lab-examples"

  cp -r "${srcdir}/templates/"* "$pkgdir/etc/${pkgname/-bin/}/templates"
  cp -r "${srcdir}/lab-examples/"* "$pkgdir/etc/${pkgname/-bin/}/lab-examples"
}


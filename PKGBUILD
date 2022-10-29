# Maintainer: aps42 <arch@andre-sterba.de>
pkgname=containerlab-bin
pkgver=0.32.3
pkgrel=1
pkgdesc='containerlab enables container-based networking labs'
arch=('x86_64')
provides=(containerlab)
url='https://github.com/srl-labs/containerlab'
license=('BSD')

source=("${pkgname/-bin/}-${pkgver}.tar.gz::https://github.com/srl-labs/containerlab/releases/download/v${pkgver}/containerlab_${pkgver}_Linux_amd64.tar.gz")

sha256sums=('f3c20e75a2116b0f7e6c46a7bf711ff15d80784d18d95513c63a41239c846cc6')

package() {
  install -Dm755 ${pkgname/-bin/} "$pkgdir"/usr/bin/${pkgname/-bin/}

  install -d "${pkgdir}/etc/${pkgname/-bin/}/templates"

  cp -r "${srcdir}/templates/"* "$pkgdir/etc/${pkgname/-bin/}/templates"
}


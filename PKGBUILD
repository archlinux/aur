# Maintainer: Giosuel <arch@giosuel.ch>
pkgname=containerlab-bin
pkgver=0.81.0
pkgrel=1
pkgdesc='Container-based networking labs'
arch=('x86_64' 'aarch64')
provides=(containerlab)
url='https://github.com/srl-labs/containerlab'
license=('BSD 3-Clause')

source=("${pkgname/-bin/}-${pkgver}.tar.gz::https://github.com/srl-labs/containerlab/releases/download/v${pkgver}/containerlab_${pkgver}_Linux_amd64.tar.gz")

sha256sums=('2236192087c4b2ced030d40d1a1515505b21befcadba96d73280003e9266b0de')

package() {
    install -Dm755 ${pkgname/-bin/} "$pkgdir"/usr/bin/${pkgname/-bin/}
    install -d "${pkgdir}/etc/${pkgname/-bin/}/lab-examples"
    cp -r "${srcdir}/lab-examples/"* "$pkgdir/etc/${pkgname/-bin/}/lab-examples"
    ln -s containerlab "$pkgdir/usr/bin/clab"
}

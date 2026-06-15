# Maintainer: Giosuel <arch@giosuel.ch>
pkgname=containerlab-bin
pkgver=0.76.1
pkgrel=1
pkgdesc='Container-based networking labs'
arch=('x86_64' 'aarch64')
provides=(containerlab)
url='https://github.com/srl-labs/containerlab'
license=('BSD 3-Clause')

source=("${pkgname/-bin/}-${pkgver}.tar.gz::https://github.com/srl-labs/containerlab/releases/download/v${pkgver}/containerlab_${pkgver}_Linux_amd64.tar.gz")

sha256sums=('0d7ba9b19169fc63d404d38aa38e9aeb2a11833f680b63eb73d489ef773c287e')

package() {
    install -Dm755 ${pkgname/-bin/} "$pkgdir"/usr/bin/${pkgname/-bin/}
    install -d "${pkgdir}/etc/${pkgname/-bin/}/lab-examples"
    cp -r "${srcdir}/lab-examples/"* "$pkgdir/etc/${pkgname/-bin/}/lab-examples"
    ln -s containerlab "$pkgdir/usr/bin/clab"
}

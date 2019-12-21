# Maintainer: zer0def <zer0def on github>
pkgname=kubedee
pkgver=0.5.0
pkgrel=1
pkgdesc='Multi-node Kubernetes clusters on LXD'
arch=('any')
url=https://github.com/schu/kubedee
license=('APACHE')
source=("https://github.com/schu/kubedee/archive/v${pkgver}.tar.gz")
depends=('lxd' 'btrfs-progs' 'cfssl' 'jq' 'kubectl')
optdepends=('kubernetes')
sha512sums=('9fcc27e96a0997680c1d863f17b7b526eedfb55e5035b2a853b5367408029469be949f0a98ebc17c9b3eff6f2a9456684c46b1a83161f8c1d7d7793f01a0470f')

package() {
    cd ${pkgname}-${pkgver}
    install -d "${pkgdir}/usr/share/kubedee"
    install -d "${pkgdir}/usr/bin"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/kubedee"
    install -Dm755 "kubedee" "${pkgdir}/usr/share/kubedee/kubedee"
    install -Dm644 "lib.bash" "${pkgdir}/usr/share/kubedee/lib.bash"
    ln -s ../share/kubedee/kubedee "${pkgdir}/usr/bin/kubedee"
    install -Dm644 -t "${pkgdir}/usr/share/kubedee/manifests/" manifests/*
}

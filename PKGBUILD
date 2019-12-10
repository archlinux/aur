# Maintainer: zer0def <zer0def on github>
pkgname=kubedee
pkgver=0.4.0
pkgrel=1
pkgdesc='Multi-node Kubernetes clusters on LXD'
arch=('any')
url=https://github.com/schu/kubedee
license=('APACHE')
source=("https://github.com/schu/kubedee/archive/v${pkgver}.tar.gz")
depends=('lxd' 'btrfs-progs' 'cfssl' 'jq' 'kubectl')
optdepends=('kubernetes')
sha512sums=('db373279a7bf1b3025a9de54ca312d4ccb632ebb098432653cc69179e06d04985dcba483134b23f47bc23f2f3dbca85a5a3bae32799d56b0dec625a567e79beb')

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

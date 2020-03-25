# Maintainer: zer0def <zer0def on github>
pkgname=kubedee
pkgver=0.6.0
pkgrel=1
pkgdesc='Multi-node Kubernetes clusters on LXD'
arch=('any')
url=https://github.com/schu/kubedee
license=('APACHE')
source=("https://github.com/schu/kubedee/archive/v${pkgver}.tar.gz")
depends=('lxd' 'btrfs-progs' 'cfssl' 'jq' 'kubectl')
optdepends=('kubernetes')
sha512sums=('9406fbe2196a3aee43e6602ec04c33823434252b53a4e4c67e0afbfbbee6191e7a0e24d4b94dc0050cc21775ce37bee21f0c4e46695a52c85ba616fe3addfd16')

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

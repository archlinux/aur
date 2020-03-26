# Maintainer: zer0def <zer0def on github>
pkgname=kubedee
pkgver=0.7.0
pkgrel=1
pkgdesc='Multi-node Kubernetes clusters on LXD'
arch=('any')
url=https://github.com/schu/kubedee
license=('APACHE')
source=("https://github.com/schu/kubedee/archive/v${pkgver}.tar.gz")
depends=('lxd' 'btrfs-progs' 'cfssl' 'jq' 'kubectl')
optdepends=('kubernetes')
sha512sums=('1f12f35ca2b25ad049c396aaeec102a4d170fd4f813c8ee0bb7f240a4bd61d4dedfc09725af0bb6afd9466488565beaba3854753045a4454931faa35b7b746f3')

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

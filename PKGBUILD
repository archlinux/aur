# Maintainer: zer0def <zer0def on github>
pkgname=kubedee
pkgver=0.3.0
pkgrel=1
pkgdesc='Multi-node Kubernetes clusters on LXD'
arch=('any')
url=https://github.com/schu/kubedee
license=('APACHE')
source=("https://github.com/schu/kubedee/archive/v${pkgver}.tar.gz")
depends=('lxd' 'cfssl' 'jq' 'kubectl')
sha512sums=('1671d05a74d04e40fdb026bd3867157f84aa55fe505e67469d40681c2f563fb36288d2971dcaf149f4eb45dbfc721b6ece83a0947fadf3c8f596811f73a0f4c5')

package() {
    cd ${pkgname}-${pkgver}
    install -d "${pkgdir}/usr/share/kubedee"
    install -d "${pkgdir}/usr/bin"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/kubedee"
    install -Dm755 "kubedee" "${pkgdir}/usr/share/kubedee/kubedee"
    install -Dm644 "lib.bash" "${pkgdir}/usr/share/kubedee/lib.bash"
    ln -s ../share/kubedee/kubedee "${pkgdir}/usr/bin/kubedee"
    cp -dr --no-preserve=ownership manifests/ "${pkgdir}/usr/share/kubedee/"
}

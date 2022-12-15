# Maintainer: Yigit Sever <yigit at yigitsever dot com>
# Contributor: vscncls <lucaslou4@protonmail.com>

pkgname=quich
pkgver=4.0.0
pkgrel=1
pkgdesc="Just an advanced terminal calculator"
url="https://github.com/Usbac/quich"
arch=('x86_64')
license=('MIT')
provides=("$pkgname")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d28d9a3552552bf692b126dacac6bcc2591531b6a44a24cb1285d2d506dadc85')

build() {
    cd ${pkgname}-${pkgver}
    NAME=${pkgname} make quich
}

package() {
    cd ${pkgname}-${pkgver}
    install -D -m755 ${pkgname} -t "${pkgdir}/usr/bin"
    install -D -m644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
    install -D -m644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

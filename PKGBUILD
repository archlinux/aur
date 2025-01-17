# Maintainer: Sematre <sematre at gmx dot de>
pkgname=piknik-bin
pkgver=0.10.2
pkgrel=1
pkgdesc="Copy/paste anything over the network."
arch=('x86_64')
url="https://github.com/jedisct1/${pkgname%-bin}"
license=('ISC')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/${pkgname%-bin}-linux_x86_64-${pkgver}.tar.gz"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/jedisct1/${pkgname%-bin}/${pkgver}/LICENSE")
sha256sums=('205e93cd4cd5c4bbde25288d54f94a386c4a6daf32a644946a32012a2128d257'
            'b36a77e68dfbe29d38ac6bb1c07ab4d61fdac81593456b14cc3e9e2d6fa3f91a')

package() {
	install -Dm 755 "linux-x86_64/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm 644 "LICENSE-${pkgver}"               "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}

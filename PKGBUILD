# Maintainer: Sematre <sematre at gmx dot de>
pkgname=typos-bin
pkgver=1.10.1
pkgrel=1

pkgdesc="Source code spell checker."
arch=('x86_64')
url="https://github.com/crate-ci/${pkgname%-bin}"
license=('MIT' 'Apache')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-x86_64-unknown-linux-musl.tar.gz"
        "LICENSE-MIT::https://raw.githubusercontent.com/crate-ci/${pkgname%-bin}/v${pkgver}/LICENSE-MIT"
        "LICENSE-APACHE::https://raw.githubusercontent.com/crate-ci/${pkgname%-bin}/v${pkgver}/LICENSE-APACHE")
sha256sums=('ae7f36aee8fd2dc25a9d04f80fe7eb77b25597a9e673f50826837bf6ae8290cc'
            '3c3d25d01d6a8e911c4baddc2a0ac74a014928066b7d29f1f7cfa73c2a7550bf'
            'c6596eb7be8581c18be736c846fb9173b69eccf6ef94c5135893ec56bd92ba08')

package() {
	install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm 644 "LICENSE-MIT"     -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm 644 "LICENSE-APACHE"  -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# Maintainer: Kevin Del Castillo R. <quebin31@gmail.com>

pkgname=genuki
pkgver=0.2.2
pkgrel=2
pkgdesc="genuki: generate unified kernel images"
arch=('any')
url=https://github.com/quebin31/genuki
license=('GPL3')
depends=('initramfs')
optdepends=()
conflicts=()
options=()
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/quebin31/${pkgname}/releases/download/${pkgver}/release.tar.gz")
sha256sums=('2f6c78dfc713344be71fc13ab948d695cb038a56a049ad7af0d0a7a43846c156')

package() {
    install -Dm755 "${srcdir}/target/release/$pkgname"           -t "${pkgdir}/usr/bin/"
    install -Dm644 "${srcdir}/share/alpm/91-genuki-install.hook" -t "${pkgdir}/usr/share/libalpm/hooks/"
    install -Dm644 "${srcdir}/share/alpm/60-genuki-remove.hook"  -t "${pkgdir}/usr/share/libalpm/hooks/"
    install -Dm755 "${srcdir}/share/alpm/genuki-install"         -t "${pkgdir}/usr/share/libalpm/scripts/"
    install -Dm755 "${srcdir}/share/alpm/genuki-remove"          -t "${pkgdir}/usr/share/libalpm/scripts/"
    install -Dm644 "${srcdir}/share/config.yaml"                 -t "${pkgdir}/usr/share/doc/${pkgname}/"
}

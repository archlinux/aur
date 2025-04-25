# Maintainer: Haotian Li <lilinzta@gmail.com>
pkgname=venera-bin
pkgdesc="A comic app"
pkgver=1.4.1
pkgrel=1
arch=('x86_64')
url="https://github.com/venera-app/venera"
license=('GPL3')
depends=('gtk3' 'webkit2gtk-4.1')
conflicts=('venera')
source=("https://github.com/venera-app/venera/releases/download/v${pkgver}/venera_${pkgver}_amd64.deb")
sha256sums=('27ea8aa733734e3605b0dc29b0b73606d1d067ae6d73f7b672c50d9abc3a1381')

package() {
    tar -I zstd -xf data.tar.zst -C "${pkgdir}/"
    install -d "${pkgdir}/usr/local/bin"
    ln -sf /usr/local/lib/venera/venera "${pkgdir}/usr/local/bin/"
}

# Maintainer: Haotian Li <lilinzta@gmail.com>
pkgname=venera-bin
pkgdesc="A comic app"
pkgver=1.3.3
pkgrel=1
arch=('x86_64')
url="https://github.com/venera-app/venera"
license=('GPL3')
depends=('gtk3' 'webkit2gtk-4.1')
conflicts=('venera')
source=("https://github.com/venera-app/venera/releases/download/v${pkgver}/venera_${pkgver}_amd64.deb")
sha256sums=('8e4795600d19a4255c8c67acec56e1c8f220e410c4ff96b2da5a7bf1f7717bf1')

package() {
    tar -I zstd -xf data.tar.zst -C "${pkgdir}/"
    install -d "${pkgdir}/usr/local/bin"
    ln -sf /usr/local/lib/venera/venera "${pkgdir}/usr/local/bin/"
}

# Maintainer: Haotian Li <lilinzta@gmail.com>
pkgname=venera-bin
pkgdesc="A comic app"
pkgver=1.2.5
pkgrel=1
arch=('x86_64')
url="https://github.com/venera-app/venera"
license=('GPL3')
depends=('gtk3' 'webkit2gtk-4.1')
conflicts=('venera')
source=("https://github.com/venera-app/venera/releases/download/v${pkgver}/venera_${pkgver}_amd64.deb")
sha256sums=('cfba429f50f886b9c533c239538da98f87acd9d423509ebcb8ddc3bbcdcf7f4e')

package() {
    tar -I zstd -xf data.tar.zst -C "${pkgdir}/"
    install -d "${pkgdir}/usr/local/bin"
    ln -sf /usr/local/lib/venera/venera "${pkgdir}/usr/local/bin/"
    chown -R root:root "${pkgdir}"
}

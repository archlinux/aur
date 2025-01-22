# Maintainer: Haotian Li <lilinzta@gmail.com>
pkgname=venera-bin
pkgdesc="A comic app"
pkgver=1.2.1
pkgrel=1
arch=('x86_64')
url="https://github.com/venera-app/venera"
license=('GPL3')
depends=('gtk3' 'webkit2gtk-4.1')
conflicts=('venera')
source=("https://github.com/venera-app/venera/releases/download/v${pkgver}/venera_${pkgver}_amd64.deb")
sha256sums=('5d84b2a3dbb57b3ac49ccb403f129e15807e4c8cc8c5afe6d9eda4ba7af7c201')

package() {
    tar -I zstd -xf data.tar.zst -C "${pkgdir}/"
    install -d "${pkgdir}/usr/local/bin"
    ln -sf /usr/local/lib/venera/venera "${pkgdir}/usr/local/bin/"
    chown -R root:root "${pkgdir}"
}

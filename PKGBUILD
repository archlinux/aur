# Maintainer: Martin Etchebarne <martin@etchebarne.net>
pkgname=kosmos-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="A highly customizable and versatile tab-based code editor."
arch=('x86_64')
url="https://github.com/etchebarne/kosmos"
license=('MIT')
depends=('webkit2gtk-4.1' 'libappindicator-gtk3' 'librsvg')
provides=('kosmos')
conflicts=('kosmos')
source=(
    "${pkgname}-${pkgver}.deb::https://github.com/etchebarne/kosmos/releases/download/v${pkgver}/kosmos_${pkgver}_amd64.deb"
    "kosmos.desktop::https://raw.githubusercontent.com/etchebarne/kosmos/v${pkgver}/src-tauri/kosmos.desktop"
    "LICENSE::https://raw.githubusercontent.com/etchebarne/kosmos/v${pkgver}/LICENSE"
)
sha256sums=('e9be0bb20a19794859eb921e3340b464530ae0e5bcfda02eace755cdd1eab31c' 'SKIP' 'SKIP')

package() {
    bsdtar -xf data.tar.gz -C "$pkgdir/"

    install -Dm644 kosmos.desktop "$pkgdir/usr/share/applications/kosmos.desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

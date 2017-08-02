# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

# All my PKGBUILDs are managed at https://github.com/eli-schwartz/pkgbuilds

pkgname=calibre-installer
pkgver=0.4
pkgrel=1
pkgdesc="Automatically install and update the calibre standalone binaries"
arch=('any')
url="https://github.com/eli-schwartz/${pkgname}"
license=('GPL')
depends=('wget' 'python')
conflicts=('calibre')
install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz.sig")
sha256sums=('e9339f86064e50bcc8e43233f8547f8272dc0b4745e0a2b338899df09c1d92eb'
            'SKIP')
validpgpkeys=("BD27B07A5EF45C2ADAF70E0484818A6819AF4A9B")

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/linux"
    ./calibre-installer.sh --local --destdir "${pkgdir}"
}

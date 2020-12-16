# Maintainer: Oliver Anhuth <oliver.anhuth at zoho.com>

pkgname=winctl
pkgver=0.8.1
pkgrel=1
pkgdesc="Window layout scripting utility for X11 (like devilspie2) which uses relative positions (percentages)"
arch=("i686" "x86_64" "armv7h")
url="https://github.com/oliver-anhuth/winctl"
license=("MIT")
depends=('lua>=5.2' 'gtk3' 'libwnck3')
source=("https://github.com/oliver-anhuth/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=("0425ab22aab80f2689b3383336f4ae0ad8c03ee03da53c8d6f86297e2d1da6d5")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -p "${pkgdir}/usr/bin"
    make install INSTALL_DIR="${pkgdir}/usr"
}

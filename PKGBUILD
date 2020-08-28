# Maintainer: Oliver Anhuth <oliver.anhuth at zoho.com>

pkgname=winctl
pkgver=0.8.0
pkgrel=3
pkgdesc="Window layout scripting utility for X11 (like devilspie2) which uses relative positions (percentages)"
arch=("i686" "x86_64" "armv7h")
url="https://github.com/oliver-anhuth/winctl"
license=("MIT")
depends=('lua>=5.2' 'gtk3' 'libwnck3')
source=("https://github.com/oliver-anhuth/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=("76662f9f911ddbf8b1e9a19b046cf65383deb8a226d87e4d49ea884aec743887")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -p "${pkgdir}/usr/bin"
    make install INSTALL_DIR="${pkgdir}/usr"
}

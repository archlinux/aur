# Maintainer: SoftExpert <softexpert at gmail dot com>

pkgname=yaak-app
pkgver=2024.7.0
pkgrel=1
pkgdesc="Yaak is a cross-platform desktop app for interacting with REST, GraphQL, gRPC and OpenAPI."
arch=('x86_64')
url="https://yaak.app/"
license=('unknown')
depends=('glibc' 'hicolor-icon-theme' 'webkit2gtk-4.1' 'gtk3')
provides=(${pkgname})
conflicts=(${pkgname})
options=(!strip)

source=("${pkgname}-${pkgver}.deb::https://releases.yaak.app/releases/${pkgver}/yaak_${pkgver}_amd64.deb")
sha256sums=('233888128fc2bfe1db638e371f812a9fccd273151b7fc2bd8bc97f5d1bc54059')

prepare() {
    bsdtar -xf data.tar.gz
}

package() {
    install -d "$pkgdir/usr/"
    cp -ar usr/{bin,lib,share} "${pkgdir}/usr"
}

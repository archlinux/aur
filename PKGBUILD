# Maintainer: SoftExpert <softexpert at gmail dot com>

pkgname=yaak-app
pkgver=2024.8.2
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
sha256sums=('d9e6b5be775255b406ba6d7d1a18b3ab177c334c0769226803be077195dbbfbd')

prepare() {
    bsdtar -xf data.tar.gz
}

package() {
    install -d "$pkgdir/usr/"
    cp -ar usr/{bin,lib,share} "${pkgdir}/usr"
}

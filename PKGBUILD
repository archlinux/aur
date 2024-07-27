# Maintainer: SoftExpert <softexpert at gmail dot com>

_app_name=yaak-app
pkgname=${_app_name}-beta
pkgver=2024.7.0
_betaver=beta.10
pkgrel=10
pkgdesc="Yaak is a cross-platform desktop app for interacting with REST, GraphQL, gRPC and OpenAPI."
arch=('x86_64')
url="https://yaak.app/"
license=('unknown')
depends=('glibc' 'hicolor-icon-theme' 'webkit2gtk-4.1' 'gtk3')
provides=(${_app_name})
conflicts=(${_app_name})
options=(!strip)

source=("${pkgname}-${pkgver}-${_betaver}.deb::https://releases.yaak.app/releases/${pkgver}-${_betaver}/yaak_${pkgver}-${_betaver}_amd64.deb")
sha256sums=('fe54d7548d77de033eb7297f69a7c68e3c4c2af016d996b1ab383783dc218df1')

prepare() {
    bsdtar -xf data.tar.gz
}

package() {
    install -d "$pkgdir/usr/"
    cp -ar usr/{bin,lib,share} "${pkgdir}/usr"
}

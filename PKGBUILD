# Maintainer: SoftExpert <softexpert at gmail dot com>

_app_name=yaak-app
pkgname=${_app_name}-beta
pkgver=2024.9.0
_betaver=beta.3
pkgrel=3
pkgdesc="Yaak is a cross-platform desktop app for interacting with REST, GraphQL, gRPC and OpenAPI."
arch=('x86_64')
url="https://yaak.app/"
license=('unknown')
depends=('glibc' 'hicolor-icon-theme' 'webkit2gtk-4.1' 'gtk3')
provides=(${_app_name})
conflicts=(${_app_name})
options=(!strip)

source=("${pkgname}-${pkgver}-${_betaver}.deb::https://releases.yaak.app/releases/${pkgver}-${_betaver}/yaak_${pkgver}-${_betaver}_amd64.deb")
sha256sums=('9fa3b372104f89f0e9e39395fd24cc3680f064f4f1bd2b7169a221844f22e451')

prepare() {
    bsdtar -xf data.tar.gz
}

package() {
    install -d "$pkgdir/usr/"
    cp -ar usr/{bin,lib,share} "${pkgdir}/usr"
}

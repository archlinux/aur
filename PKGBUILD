# Maintainer: SoftExpert <softexpert at gmail dot com>

_app_name=yaak-app
pkgname=${_app_name}-beta
pkgver=2024.9.0
_betaver=beta.1
pkgrel=1
pkgdesc="Yaak is a cross-platform desktop app for interacting with REST, GraphQL, gRPC and OpenAPI."
arch=('x86_64')
url="https://yaak.app/"
license=('unknown')
depends=('glibc' 'hicolor-icon-theme' 'webkit2gtk-4.1' 'gtk3')
provides=(${_app_name})
conflicts=(${_app_name})
options=(!strip)

source=("${pkgname}-${pkgver}-${_betaver}.deb::https://releases.yaak.app/releases/${pkgver}-${_betaver}/yaak_${pkgver}-${_betaver}_amd64.deb")
sha256sums=('435a1e265bdd38331ab901a7658ec7129fccc1068924b26e2a8803fcf4df672f')

prepare() {
    bsdtar -xf data.tar.gz
}

package() {
    install -d "$pkgdir/usr/"
    cp -ar usr/{bin,lib,share} "${pkgdir}/usr"
}

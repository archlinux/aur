# Maintainer: SoftExpert <softexpert at gmail dot com>

_app_name=yaak-app
pkgname=${_app_name}-beta
pkgver=2024.8.0
_betaver=beta.4
pkgrel=4
pkgdesc="Yaak is a cross-platform desktop app for interacting with REST, GraphQL, gRPC and OpenAPI."
arch=('x86_64')
url="https://yaak.app/"
license=('unknown')
depends=('glibc' 'hicolor-icon-theme' 'webkit2gtk-4.1' 'gtk3')
provides=(${_app_name})
conflicts=(${_app_name})
options=(!strip)

source=("${pkgname}-${pkgver}-${_betaver}.deb::https://releases.yaak.app/releases/${pkgver}-${_betaver}/yaak_${pkgver}-${_betaver}_amd64.deb")
sha256sums=('ee288669178b49a5cba9b5839ba5fbbe4be32742dc767a7547c5a9d6f58c756e')

prepare() {
    bsdtar -xf data.tar.gz
}

package() {
    install -d "$pkgdir/usr/"
    cp -ar usr/{bin,lib,share} "${pkgdir}/usr"
}

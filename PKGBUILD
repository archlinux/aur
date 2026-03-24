# Maintainer: Cryptographic Triangles Team
pkgname=triangles-qt-bin
pkgver=5.3.6
pkgrel=1
pkgdesc="Cryptographic Triangles (TRI) cryptocurrency wallet - Qt GUI"
arch=('x86_64')
url="https://cryptographic-triangles.org"
license=('MIT')
depends=('qt5-base' 'openssl' 'boost-libs' 'db' 'leveldb' 'libevent' 'miniupnpc' 'tor')
optdepends=('tor: anonymous networking support')
provides=('triangles-qt' 'trianglesd')
conflicts=('triangles-qt' 'trianglesd')
source=(
    "triangles-qt-${pkgver}::https://github.com/SamiAhmed7777/triangles_v5/releases/download/v${pkgver}/Cryptographic-Triangles-v${pkgver}-linux-x64-qt"
    "trianglesd-${pkgver}::https://github.com/SamiAhmed7777/triangles_v5/releases/download/v${pkgver}/Cryptographic-Triangles-v${pkgver}-linux-x64-daemon"
    "triangles-qt.desktop"
)
sha256sums=(
    'ed220eb8d0b403f62cdac28988541fd1a27864491e233216f9c00a4c2537b4a3'
    '4d2ab25d61127d6aff3e6f3069556d04f4b823f8849e97629c12871ad4779517'
    'SKIP'
)

package() {
    install -Dm755 "triangles-qt-${pkgver}" "${pkgdir}/usr/bin/triangles-qt"
    install -Dm755 "trianglesd-${pkgver}" "${pkgdir}/usr/bin/trianglesd"
    install -Dm644 "triangles-qt.desktop" "${pkgdir}/usr/share/applications/triangles-qt.desktop"
}

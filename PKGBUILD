# Maintainer: Guru <anjanaya@gmail.com>
pkgname=varlock-bin
pkgver=1.6.1
pkgrel=1
pkgdesc="Load and validate environment variables from .env files with schema and encryption"
arch=('x86_64' 'aarch64')
url="https://varlock.dev"
license=('MIT')
provides=('varlock')
conflicts=('varlock')
options=('!strip')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/dmno-dev/varlock/varlock@${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/dmno-dev/varlock/releases/download/varlock@${pkgver}/varlock-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/dmno-dev/varlock/releases/download/varlock@${pkgver}/varlock-linux-arm64.tar.gz")
sha256sums=('90c34fcc1c80e7cd811652e54ed411597cdbc1bc2a22efb7d6acb133f24a7942')
sha256sums_x86_64=('ff31bfeec91532a2445142e59607a6bd6c3cd08a551e14f918826f18b83eb683')
sha256sums_aarch64=('7b191f1bf225fb95a7217daad1853b966e6310b3541aa98d8a3bc5634ccfc446')

package() {
    install -Dm755 "${srcdir}/varlock" "${pkgdir}/usr/bin/varlock"
    install -Dm755 "${srcdir}/varlock-local-encrypt" "${pkgdir}/usr/bin/varlock-local-encrypt"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

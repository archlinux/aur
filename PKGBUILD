# Maintainer: Guru <anjanaya@gmail.com>
pkgname=varlock-bin
pkgver=1.25.0
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
sha256sums_x86_64=('46c8bc6bce98878afe70ec3bfe16c8b56cd48a41687ea5418c8ec88844c0d073')
sha256sums_aarch64=('900dfc310a8d94023bc74bfe034903fe5580ac69809740e5baf03b96998d9d71')

package() {
    install -Dm755 "${srcdir}/varlock" "${pkgdir}/usr/bin/varlock"
    install -Dm755 "${srcdir}/varlock-local-encrypt" "${pkgdir}/usr/bin/varlock-local-encrypt"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

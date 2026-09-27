# Maintainer: Guru <anjanaya@gmail.com>
pkgname=varlock-bin
pkgver=1.21.0
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
sha256sums_x86_64=('828c052895c226630d451fd1a663361a86cab60ac0ba35394a26cd9a94331b99')
sha256sums_aarch64=('16f1773b769f4da6e27a0610c2cc6686a2dfb1eaff17c4e952a968831cb298da')

package() {
    install -Dm755 "${srcdir}/varlock" "${pkgdir}/usr/bin/varlock"
    install -Dm755 "${srcdir}/varlock-local-encrypt" "${pkgdir}/usr/bin/varlock-local-encrypt"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

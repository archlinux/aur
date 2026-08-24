# Maintainer: Guru <anjanaya@gmail.com>
pkgname=varlock-bin
pkgver=1.17.0
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
sha256sums_x86_64=('9b0ee1a7d42469c27dbfa284fa4337eb02c39c259198f36c5b127d5c3fb7a89d')
sha256sums_aarch64=('08ea40fdca2ffeb7bb0afe6f47813bab43298c1ce897f07e013aae2649bfc01a')

package() {
    install -Dm755 "${srcdir}/varlock" "${pkgdir}/usr/bin/varlock"
    install -Dm755 "${srcdir}/varlock-local-encrypt" "${pkgdir}/usr/bin/varlock-local-encrypt"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

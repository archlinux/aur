# Maintainer: Guru <anjanaya@gmail.com>
pkgname=varlock-bin
pkgver=1.21.1
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
sha256sums_x86_64=('3920b4696e1922287402113dad73a31b7dea94973ccbba8f2628020a20d2243a')
sha256sums_aarch64=('01dfd04aa833c445e1f11d7206f80b4ef5f7793161abcd1cc5b76e3b9346225c')

package() {
    install -Dm755 "${srcdir}/varlock" "${pkgdir}/usr/bin/varlock"
    install -Dm755 "${srcdir}/varlock-local-encrypt" "${pkgdir}/usr/bin/varlock-local-encrypt"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

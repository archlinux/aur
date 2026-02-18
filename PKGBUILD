# Maintainer: Daniel Baldwin <daniel@baldwin.io>
pkgname=vop-bin
pkgver=0.2.6
pkgrel=1
pkgdesc="AWS credential management via 1Password"
arch=('x86_64' 'aarch64')
url="https://github.com/NodeSpy/vop"
license=('MIT')
depends=('1password-cli')
provides=('vop')
conflicts=('vop')

source_x86_64=("${url}/releases/download/v${pkgver}/vop-linux-amd64")
source_aarch64=("${url}/releases/download/v${pkgver}/vop-linux-arm64")

sha256sums_x86_64=('757d828e0e0de54e9e9432dc9e83663480a596eda3577543e5ac790c3b9c94be')
sha256sums_aarch64=('56ce9d0445a863ee3f85e9c89e55383719305b06a97312b1f695fa79fa391711')

source+=("LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
sha256sums+=('6a393bdfa6c20c218bf73d378cf2e5b0fbf0e95c2a9644baf5714dd9d330dc64')

package() {
    install -Dm755 "${srcdir}/vop-linux-"* "${pkgdir}/usr/bin/vop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

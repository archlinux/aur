# Maintainer: Daniel Baldwin <daniel@baldwin.io>
pkgname=vop-bin
pkgver=0.3.2
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

sha256sums_x86_64=('6dee7ce7ace7cdf40260271db3876cd60d178f75f566d95241791041723becd5')
sha256sums_aarch64=('5c4ad15c626dae67190d3a94c465ffc080efecf76b2458b33698b14e7efdb3c0')

source+=("LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
sha256sums+=('6a393bdfa6c20c218bf73d378cf2e5b0fbf0e95c2a9644baf5714dd9d330dc64')

package() {
    install -Dm755 "${srcdir}/vop-linux-"* "${pkgdir}/usr/bin/vop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

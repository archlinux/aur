# Maintainer: Daniel Baldwin <daniel@baldwin.io>
pkgname=vop-bin
pkgver=0.2.7
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

sha256sums_x86_64=('73d6eeb4099005d3d43cde76ad84995d685394006210e28c2201d013d5b16ddf')
sha256sums_aarch64=('8d35996cb7947fea02d8504a7ee8f7dbddd87e680fb80871f3ba76b8fa0a4633')

source+=("LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
sha256sums+=('6a393bdfa6c20c218bf73d378cf2e5b0fbf0e95c2a9644baf5714dd9d330dc64')

package() {
    install -Dm755 "${srcdir}/vop-linux-"* "${pkgdir}/usr/bin/vop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

_pkgname=ddns-go
pkgname=${_pkgname}-bin
pkgver="6.12.4"
pkgrel=1
pkgdesc='A simple, easy-to-use ddns service optimized for Chinese Mainland users'
license=('MIT')
arch=(
    "x86_64"
    "i686"
    "aarch64"
    "armv7h"
    "armv6h"
    "armv5tel"
    "mips"
    "mipsel"
    "mips64"
    "mips64el"
    "mipsel"
)

url="https://github.com/jeessy2/${_pkgname}"
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}.service" ddns-go.install)
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_x86_64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_i386.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv7.tar.gz")
source_armv6h=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6.tar.gz")
source_armv5tel=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv5.tar.gz")
source_mips=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_mips_hardfloat.tar.gz")
source_mipsel=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_mipsle_hardfloat.tar.gz")
source_mips64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_mips64_hardfloat.tar.gz")
source_mips64el=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_mips64le_hardfloat.tar.gz")
# https://github.com/jeessy2/ddns-go/releases/download/v$pkgver/checksums.txt
sha256sums=('4a8086b2ef19c1c2f9c60f7cae5b852e6ce4a28a11709065f5099f001f8b6934'
            'caf121192d465753c553163c8cd6fe56b3a5d27edf9fbce489bb3c1e7c27fe65')
sha256sums_x86_64=('5b965b0245d4d3744527eb3ff6e95d33bff052c47d8009c6e020d86fb98ccbd5')
sha256sums_i686=('5fc3099e70591af4893a2d3122002489f5e187f1a9853482bcb3b07abaabb597')
sha256sums_aarch64=('8e1baa94f3709d28274022ccb2e6dcb1b8aafa154b5e927dc1f571764278b84b')
sha256sums_armv7h=('7d31ee827aa59dfd693d1ac5651242fb5bfbdbd0db18674934a3491f6a51b227')
sha256sums_armv6h=('bcecec3370f85b7ea7076cd5220806fcd49bc3974c6e68a7fc21dffcd41c8b46')
sha256sums_armv5tel=('775789f4a7c89aa0faad55aa497876285d6f5e124c702b12f54c5ee41bfb5440')
sha256sums_mips=('f0f58d0b4cb11bad25c5e24376dd7d4d8ff287e7431584f430160a78cfe5f86b')
sha256sums_mipsel=('3d62e8dd7ca2b6f5567056ea23eedb890d17fade8a6839723eb4e1eddaf80d67')
sha256sums_mips64=('f990921c01d6f2c9980542b6f06369d99641c7a703827a567922f99d2eb5a9f7')
sha256sums_mips64el=('957b10a01bd709e57280b8c9927d260d0177b7c05d4e3bbe808d9f58fd5efa53')
install=ddns-go.install

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    mkdir -p "${pkgdir}/etc/ddns-go"
    chmod 700 "${pkgdir}/etc/ddns-go"
}

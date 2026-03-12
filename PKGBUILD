_pkgname=ddns-go
pkgname=${_pkgname}-bin
pkgver="6.16.1"
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
sha256sums_x86_64=('60ff4c58bcfa71d8901728cdee2ea7dd0f8d99a584f51ac21d0cbe5eadaeed9f')
sha256sums_i686=('fcdd57aa9a782976efb71782b9d94e3e22d7c84ad37735c88f7c939182191f07')
sha256sums_aarch64=('0d5f67a0a319f68fea29f123203757a6bb221d7d353a70b2bf7b7a0b7d4067da')
sha256sums_armv7h=('11f5fbb5736acb4e298bed15f2c56737d7aafd5c267607518876ecdc65d18035')
sha256sums_armv6h=('8bf69c5602405bb37ab962dafc4c5d4eab828b5d00af30d87ff12c2cad672648')
sha256sums_armv5tel=('5ead893c70e87e5c17a65d5c87718098ff8a0c2a24775859cf04983cffa1dde9')
sha256sums_mips=('22e3c6c22c3187273da88a421a05a83e644a279b6136ac17c0109b0f7581268f')
sha256sums_mipsel=('91df49487a138c8b144d10612f9e93de8b0ee94b908fbe1a44b854cfea67b5e6')
sha256sums_mips64=('95048bb62010d4d03692f6336238aa9563c630e0ab072c0153d98761151c6ea8')
sha256sums_mips64el=('38800d485ae5e9b5795b3c0f35125ac5791f34188b30a01093e3ef3b2e37d484')
install=ddns-go.install

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    mkdir -p "${pkgdir}/etc/ddns-go"
    chmod 700 "${pkgdir}/etc/ddns-go"
}

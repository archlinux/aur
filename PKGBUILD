_pkgname=ddns-go
pkgname=${_pkgname}-bin
pkgver="6.13.3"
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
sha256sums_x86_64=('6b5ae0587f582f56d5f8dbb61bbb5ee8e88eb89304ad919ca69465e3cb5275f0')
sha256sums_i686=('15665e76c3b031281b82c886bcaa4ce4d2493eafb77806fa40b930e39e29c62f')
sha256sums_aarch64=('407f60cbad86ab247aa51514eeacae020dda6bf8b9c3f992c4bbb572b90d295f')
sha256sums_armv7h=('18c74c19589bf5c0c35cf26bcd978bab27b3dd235e23e36b9bf57095d26fd4c4')
sha256sums_armv6h=('77ccf318e66ea10bcb68ac6d76b9eec1a34954fecb8850fe153ff1bfbcb6e4ea')
sha256sums_armv5tel=('b6fda88c725847e61d270a16066b241a871d4e342d1a48d265d899c3b6252f9f')
sha256sums_mips=('6550a1b009f65b5a814d969ac0df9c7cc30a537226ba5cc57db379bd02a46c35')
sha256sums_mipsel=('eb249bcda21f513b254db567ce286a4a97f6fcc1e4a0f9708b0de7b9ecae4424')
sha256sums_mips64=('b4a3d0f53df7a48b959c8e4b5de804ec30c6707c1592be996f250a7de5a02e06')
sha256sums_mips64el=('724f79c877b7beb7f25d51cd170fc5b08107a027606191e604e5a6da0ed78d0d')
install=ddns-go.install

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    mkdir -p "${pkgdir}/etc/ddns-go"
    chmod 700 "${pkgdir}/etc/ddns-go"
}

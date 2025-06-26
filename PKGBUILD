_pkgname=ddns-go
pkgname=${_pkgname}-bin
pkgver="6.11.0"
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
# https://github.com/jeessy2/ddns-go/releases/download/v${pkgver}/checksums.txt
sha256sums=('4a8086b2ef19c1c2f9c60f7cae5b852e6ce4a28a11709065f5099f001f8b6934'
            'caf121192d465753c553163c8cd6fe56b3a5d27edf9fbce489bb3c1e7c27fe65')
sha256sums_x86_64=('5a19d0c868b644ff83410ecf79f42d41a8898a2b20876fbe3716a5378c9da514')
sha256sums_i686=('ad0118e85e994ebfc1576c8d31f7cc49569428b328381e41642a5823bf55efa2')
sha256sums_aarch64=('38c8b1f1d1cf6830a1e98edec08c4bb5b59b3d73ae8152002443942d7e114eeb')
sha256sums_armv7h=('e920531523e7b813efda84febb545d0e1769a078a2ab0d73f3f6d8bca02a16ca')
sha256sums_armv6h=('223280d48e739eb4bf75714b37805405b93a23f95e19d2e233fba46c5b53fb19')
sha256sums_armv5tel=('607493f24727ad71a678f374726b3d5932b8b130d4ba70aa1219b859bc9dc6f0')
sha256sums_mips=('b6e8869edd353f02305b89389319f4a562fbb02726aacf082a26d4d0071b01d5')
sha256sums_mipsel=('e4179b4a069fa9ae6e2a56b01f5929d46fd71eb2f6d66b5224b0a0642c8bd49e')
sha256sums_mips64=('dda9b2fedc0fe9f60e303da0ac83b7eba56efeb07c449595931367d3c10fe06b')
sha256sums_mips64el=('4c4c603449647b7dcec43197213c95df3a94549fa2f41772becb467be3aeef0a')
install=ddns-go.install

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    mkdir -p "${pkgdir}/etc/ddns-go"
    chmod 700 "${pkgdir}/etc/ddns-go"
}

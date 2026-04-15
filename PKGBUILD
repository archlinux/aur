_pkgname=ddns-go
pkgname=${_pkgname}-bin
pkgver="6.16.6"
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
    "riscv64"
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
source_riscv64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_riscv64.tar.gz")
# https://github.com/jeessy2/ddns-go/releases/download/v$pkgver/checksums.txt
sha256sums=('4a8086b2ef19c1c2f9c60f7cae5b852e6ce4a28a11709065f5099f001f8b6934'
            'caf121192d465753c553163c8cd6fe56b3a5d27edf9fbce489bb3c1e7c27fe65')
sha256sums_x86_64=('599172b83d364ed8487115bdae7fd7d6629d4bb5627ce567bc1666838008328f')
sha256sums_i686=('1dfe7a7039f4d21c56a4c4b711fd95652ae5b39eb1016de0946edc45ba46c6dd')
sha256sums_aarch64=('6bd2a38723ebb2302556b08078c0199f1bbf8d86bc4ef678b08e97668c823b78')
sha256sums_armv7h=('58df1eb11632bb50e8c05b66a93d8bace61f99722d8fbf4339de3feb67ffcd88')
sha256sums_armv6h=('141cdba9934a177857fccd507f1a83caddbfbbc571cdaec1f4a05b1f5d4109cc')
sha256sums_armv5tel=('998f423c748c6afa7c507fe69a27e59971700fa72ceac8233bf02f8132c68027')
sha256sums_mips=('f2ed57ceadd0c824894078edc9a2806047acebb24c0f90e5010bfec434a8d2c2')
sha256sums_mipsel=('28b537681d3ed526f89bb99422067a7eba58fe89ba3ba027194e45801bf2a1ea')
sha256sums_mips64=('49be3147600136cd8ab65eb55d6ab96cfe4f5dbd71cdb53b4a55934ad6c2dd2c')
sha256sums_mips64el=('6ebb9fb20319d0f5b4a3bf5dde20d05fd7e4c6515196ee8b479b7cea740d0a19')
sha256sums_riscv64=('58a513b29627e4540e8e3ae2fd7df70adb8e19402cd2b197f905908a0472ff60')
install=ddns-go.install

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    mkdir -p "${pkgdir}/etc/ddns-go"
    chmod 700 "${pkgdir}/etc/ddns-go"
}

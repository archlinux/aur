_pkgname=ddns-go
pkgname=${_pkgname}-bin
pkgver="6.17.3"
pkgrel=2
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
sha256sums_x86_64=('56bd7dd24a8bef126468c2a58257913fb6686d57972646e0c7b1095438d8afab')
sha256sums_i686=('f1d74e8e99cf10841260105b05ffcc7f8326a2f53272eaf543dc8d39c40bf7f6')
sha256sums_aarch64=('fef251d2a93dba769a5414511fa3ddf73a5738ec21693ce9f995dcf11078474c')
sha256sums_armv7h=('ed57f172e160d8e5a52a3082559534d0400960df64b32cb65d38f8fe5c65d1de')
sha256sums_armv6h=('e5fff6861aa2431ca3fc3a88f62c179be84d43d1763af699bf0981a22896addb')
sha256sums_armv5tel=('b3dc69d56e7444b9033b3e86b6057b049789341411dd9e4079ed9ca28886dc43')
sha256sums_mips=('399555f8789e693779ae2bc59f54edc86ff7db3239ccee0bcae9595f14310c4f')
sha256sums_mipsel=('e672003a987a181f1742225a1fead1b1f0b270a6ccf51ac8b93df2d41d534bd7')
sha256sums_mips64=('4503663ef3ac575f42d5ef74058f664b4e60735786a3ccaf0bafb73f52e8baeb')
sha256sums_mips64el=('12412ec4b4cfc870ee78595fddf767f97a2ff1d0048d38ebee1c56320b323f46')
sha256sums_riscv64=('8429aeca9eb83a8ac51b43fd9a7adf0d753e6fc17d34231d81ca817a0cec831b')
install=ddns-go.install

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    mkdir -p "${pkgdir}/etc/ddns-go"
    chmod 700 "${pkgdir}/etc/ddns-go"
}

_pkgname=ddns-go
pkgname=${_pkgname}-bin
pkgver="6.17.1"
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
sha256sums_x86_64=('cf11b2ab820f91c61ce229afb94b4a3e1d883ec58cb6aeec5e8d14e312dd104b')
sha256sums_i686=('0ec571eb7ba1dae9c67db06b6476c656bf09c99db41ffc4bbf8e22b2b2fd3cf9')
sha256sums_aarch64=('af1445c0f63aa08cb530ec6176d781fc1f3f3185f9410a9cbd021a6caa3dea28')
sha256sums_armv7h=('3c17af9428655814b538ddcd115e184c98fcc89a8f29ad14610a1a0284e6f87e')
sha256sums_armv6h=('21059b57141ffda9781e2a7d65e49f7700f04a1d6ccc5116cfbbab9c0d61b4af')
sha256sums_armv5tel=('b8ff1c535918d08db41ca55c8bba66f2e067c3f7ead0e04fefd6e70b603bc95a')
sha256sums_mips=('35e4e93cf2f978305e86693fa5d60be311986cee3bf8b17618a7177f58a32d53')
sha256sums_mipsel=('cefe2bd5639067cff3be2cf775dcc470705eab9b5678f1ae5bfa8dada73aa749')
sha256sums_mips64=('b46bb77633793c8c2c05d227022a4c0b9c682b72dc76b150d4c6fffbb7cb6f74')
sha256sums_mips64el=('fe55864988927fbcc96bff79603cf2163c9f6012b2065780b4418c3fae879f32')
sha256sums_riscv64=('fe84f1282ecf0b49c91d33332f12d3f56f1a07b2e81bed2898cc2289d8b58cad')
install=ddns-go.install

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    mkdir -p "${pkgdir}/etc/ddns-go"
    chmod 700 "${pkgdir}/etc/ddns-go"
}

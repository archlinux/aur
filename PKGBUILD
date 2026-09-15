_pkgname=ddns-go
pkgname=${_pkgname}-bin
pkgver="6.17.7"
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
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_i386.tar.gz")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
source_armv5tel=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv5.tar.gz")
source_armv6h=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6.tar.gz")
source_armv7h=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv7.tar.gz")
source_mips64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_mips64_hardfloat.tar.gz")
source_mips64el=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_mips64le_hardfloat.tar.gz")
source_mips=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_mips_hardfloat.tar.gz")
source_mipsel=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_mipsle_hardfloat.tar.gz")
source_riscv64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_riscv64.tar.gz")
# https://github.com/jeessy2/ddns-go/releases/download/v$pkgver/checksums.txt
sha256sums=('4a8086b2ef19c1c2f9c60f7cae5b852e6ce4a28a11709065f5099f001f8b6934'
            'caf121192d465753c553163c8cd6fe56b3a5d27edf9fbce489bb3c1e7c27fe65')
sha256sums_x86_64=('b1f88532c60f4e94f973eaf4d56b92a030f4c97fb98f146f8c591d55ad6ec118')
sha256sums_i686=('c0261facc7088a01db4de295a84db0250a3725d753560feb00c223e1ad3a7f50')
sha256sums_aarch64=('c65deb2cee0b39f0c6fd2659ee878682189fea79fc66523a621efb6270d66059')
sha256sums_armv7h=('e66fd0482fb3e014bce482dff0064519cc492ce3157cb3e0c58a9b6289282d91')
sha256sums_armv6h=('653a394220b8b6552200717c1f6a3b9656f3aec818373f7082c6fb922e1c82e0')
sha256sums_armv5tel=('770552a543cf60def12785721616f7cae67527eaef78f7e855aeeba31484567d')
sha256sums_mips=('7fbe5bdc106b029387fbb4ce7590d314451e3d2127cb4a22e0dc74d6649f42bc')
sha256sums_mipsel=('fdb22473af92a29ba093123d379cfdaa59c729eae6acad95c630d0d6fe0873a3')
sha256sums_mips64=('4a09a2afdcf6a84c228b1ad11a9b1f9fcb959576df52877151eee529dc0dd99e')
sha256sums_mips64el=('ade5ec282590de65b787e0a76138da9315377e3bf92c0c2bc315b3e076c759af')
sha256sums_riscv64=('6885231d52507c1f559665412a5ad942ad4e5876264f809bed332a7f012d5d4d')
install=ddns-go.install

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    mkdir -p "${pkgdir}/etc/ddns-go"
    chmod 700 "${pkgdir}/etc/ddns-go"
}

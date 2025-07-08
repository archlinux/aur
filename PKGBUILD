_pkgname=ddns-go
pkgname=${_pkgname}-bin
pkgver="6.11.3"
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
sha256sums_x86_64=('bb4cea8c619041f32e2f0195ab8935584cbff3595f8d2325cb2294978cc201bc')
sha256sums_i686=('fb021e33a8710b954195eb7f2b94a00146d71b8276a166f3742f4cf40a935927')
sha256sums_aarch64=('3823aa509747bd972f48fa1ca59220c858062294dcd007c0bc3b4c2577046640')
sha256sums_armv7h=('38d309dfa31764fe4245ebc5121c061d74a870d8e110db2ebc064968842bbe84')
sha256sums_armv6h=('fc434474d2e675301c5969f0d1bbdd1625044869ec4a355bee67ffabf3dba9d0')
sha256sums_armv5tel=('892333204796598a7e39fb02367c774adfc8bb0dfe2935da123b095024eeec76')
sha256sums_mips=('c32e46857c581dc4f28cfade1363dd88f93668a66fb4f5cfde5ea333855c49fb')
sha256sums_mipsel=('20d9f98e6ba1428c482e4b228c9126453269be436c9f614e1d50dc39da0ad3a8')
sha256sums_mips64=('4f0714a3397048615fa6b396e137232499dbe3b6b36c403ae7095eb2636dd7a7')
sha256sums_mips64el=('e24cdd9bd11d5ee72f735385cb4bec68acc3a08d24c6c252848bf0838f7b62fd')
install=ddns-go.install

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    mkdir -p "${pkgdir}/etc/ddns-go"
    chmod 700 "${pkgdir}/etc/ddns-go"
}

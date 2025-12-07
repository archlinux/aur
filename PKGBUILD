_pkgname=ddns-go
pkgname=${_pkgname}-bin
pkgver="6.14.0"
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
sha256sums_x86_64=('84c0e09b40bed554b77abcb4575c803e8787cbb80102213590a4ff48badae387')
sha256sums_i686=('17f18b893aaf52604b59451ceda3d337478d557fe6f603351ece5db56d80f039')
sha256sums_aarch64=('9600d95c41f70bdda9ef4f97b3701a975407d0fffb4221a53424de87623bcaa8')
sha256sums_armv7h=('03705fb51b3e417a2226540de876cf1c0f053201bfa17545475e350ba0bae4fc')
sha256sums_armv6h=('e0578b8b7ef12eead0b52c69f3e178b47f92269bbd153df3768b976c5d73a091')
sha256sums_armv5tel=('40272958d683a7dd56fdfc1e6964b4733c61774a4608028d6a6e62e65dc21dd2')
sha256sums_mips=('e971facab1ce2d8fc14d23283969df07bbb98f2b7ae7ba89dbac824abc05f43c')
sha256sums_mipsel=('15323e295bd0bf968da64a22942bcb4e0bfe0aae54b85b079a3086142c5a8f0b')
sha256sums_mips64=('970687055019141728857c9267d23cf878c1e8c359f0d1ea99954245b8fae518')
sha256sums_mips64el=('3804830bbf0360e9557dc9027c890babab234826a0175a61bfc2c4d32812c38c')
install=ddns-go.install

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    mkdir -p "${pkgdir}/etc/ddns-go"
    chmod 700 "${pkgdir}/etc/ddns-go"
}

_pkgname=ddns-go
pkgname=${_pkgname}-bin
pkgver="6.13.1"
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
sha256sums_x86_64=('16c10518e71d8f77851fa9a5b38f194fa364ec95ae9d72934be150f9e86e7808')
sha256sums_i686=('0aa1f96ee130e4f5b1c3551558eecb0f1bc09c66c8dab226a271f224aefccfa8')
sha256sums_aarch64=('311c56ca450caa394bf66e7d26668df39d4e8212235cd8c2ff89bcd4ec5d477e')
sha256sums_armv7h=('6876efd0d1589d833b88480e2edfd7ce17ccff09e641810514ef646ca247c7f1')
sha256sums_armv6h=('6867f428dcb157ce3f062ae480b955b77a01b644edb1b24c95d97080aa7c7cbc')
sha256sums_armv5tel=('84fb1b4fae00e1472bab1a340a01d505a44ebc06efa022dea43a1a598bf28c77')
sha256sums_mips=('8d1a3fc5a3fe101fd1a302b4c151886ee745ad8ea781c94c322acff5a5651153')
sha256sums_mipsel=('b862b1388021f33c476ad807d81e6038c4c5cf03c9e2078010445aa6e06151f5')
sha256sums_mips64=('115b13b5866d58f770dfd6a56bd3c0f7087bcef1cb096724e5e1c4743e74259e')
sha256sums_mips64el=('566c40074f9a2370e36a2b3ca63fdc5d249c3c62b651840c38a1bbc1d18ea586')
install=ddns-go.install

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    mkdir -p "${pkgdir}/etc/ddns-go"
    chmod 700 "${pkgdir}/etc/ddns-go"
}

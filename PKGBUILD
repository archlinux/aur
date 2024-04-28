_pkgname=ddns-go
pkgname=${_pkgname}-bin
pkgver="6.5.0"
pkgrel=1
pkgdesc='A simple, easy-to-use ddns service optimized for Chinese Mainland users'
license=('MIT')
arch=('x86_64' 'aarch64')
url="https://github.com/jeessy2/${_pkgname}"
provides=(${_pkgname})
conflicts=(${_pkgname})
source=(${_pkgname}.service ddns-go.install)
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums=('4a8086b2ef19c1c2f9c60f7cae5b852e6ce4a28a11709065f5099f001f8b6934'
            'caf121192d465753c553163c8cd6fe56b3a5d27edf9fbce489bb3c1e7c27fe65')
sha256sums_x86_64=('0f5ce89d8e69ff265abdf6cc182f6f38056218a9bcc170ecb975ac4d762b9b2f')
sha256sums_aarch64=('153f29c7e2c8625d6dead187cfd47c5fc4ed401f4e68440d071540ceef7c5c79')
install=ddns-go.install

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    mkdir -p "${pkgdir}/etc/ddns-go"
    chmod 700 "${pkgdir}/etc/ddns-go"
}

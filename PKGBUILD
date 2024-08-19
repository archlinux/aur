_pkgname=ddns-go
pkgname=${_pkgname}-bin
pkgver="6.6.9"
pkgrel=2
pkgdesc='A simple, easy-to-use ddns service optimized for Chinese Mainland users'
license=('MIT')
arch=('x86_64' 'i686' 'i386' 'aarch64' 'armv7h')
url="https://github.com/jeessy2/${_pkgname}"
provides=(${_pkgname})
conflicts=(${_pkgname})
source=(${_pkgname}.service ddns-go.install)
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_x86_64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_i386.tar.gz")
source_i386=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_i386.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv7.tar.gz")
sha256sums=('4a8086b2ef19c1c2f9c60f7cae5b852e6ce4a28a11709065f5099f001f8b6934'
            'caf121192d465753c553163c8cd6fe56b3a5d27edf9fbce489bb3c1e7c27fe65')
sha256sums_x86_64=('033f5668a502b9a1f2d3d9653aeb739874651cad0ec1cb52ab2a93159999327e')
sha256sums_i686=('cd7ab8fd6fed3f8eba00dde7b14f233bd86d5c0c6a6b7dd753c9420825f3d5ec')
sha256sums_i386=('cd7ab8fd6fed3f8eba00dde7b14f233bd86d5c0c6a6b7dd753c9420825f3d5ec')
sha256sums_aarch64=('673f5e094a4732983cc924161435c51c5f455a3debb3711f07393416e50910df')
sha256sums_armv7h=('e71be0b6fcb60e4ad719cf649eeab88cccd654545bb88f1f83817bba5a48e54f')
install=ddns-go.install

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    mkdir -p "${pkgdir}/etc/ddns-go"
    chmod 700 "${pkgdir}/etc/ddns-go"
}

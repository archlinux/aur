_pkgname=ddns-go
pkgname=${_pkgname}-bin
pkgver="6.8.1"
pkgrel=1
pkgdesc='A simple, easy-to-use ddns service optimized for Chinese Mainland users'
license=('MIT')
arch=('x86_64' 'i686' 'i386' 'aarch64' 'armv7h')
url="https://github.com/jeessy2/${_pkgname}"
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}.service" ddns-go.install)
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_x86_64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_i386.tar.gz")
source_i386=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_i386.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv5.tar.gz")
# https://github.com/jeessy2/ddns-go/releases/download/v${pkgver}/checksums.txt
sha256sums=('4a8086b2ef19c1c2f9c60f7cae5b852e6ce4a28a11709065f5099f001f8b6934'
            'caf121192d465753c553163c8cd6fe56b3a5d27edf9fbce489bb3c1e7c27fe65')
sha256sums_x86_64=('8d793f51462711dc6870753a9af937cd68f1525ac82748fa697dca9554350949')
sha256sums_i686=('03bead4b1f874fd6beb5cd4b6026f00bdd62835115dcfc186d838895dd221a35')
sha256sums_i386=("${sha256sums_i686[0]}")
sha256sums_aarch64=('b9af08575048646fc9a0c1f37a9640fabf7026f94920c6e083a7ab7af734598e')
sha256sums_armv7h=('fa723b07e535153efdf81627f6465999ebdb27622052c696e87626da3e977827')
install=ddns-go.install

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    mkdir -p "${pkgdir}/etc/ddns-go"
    chmod 700 "${pkgdir}/etc/ddns-go"
}

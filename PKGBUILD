_pkgname=ddns-go
pkgname=${_pkgname}-bin
pkgver=5.6.1
pkgrel=1
pkgdesc='A simple, easy-to-use ddns service optimized for Chinese Mainland users'
license=('MIT')
arch=('x86_64')
url="https://github.com/jeessy2/${_pkgname}"
provides=(${_pkgname})
conflicts=(${_pkgname})
source=(${_pkgname}.service)
source_x86_64=("https://github.com/jeessy2/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_x86_64.tar.gz")
sha256sums=('4a8086b2ef19c1c2f9c60f7cae5b852e6ce4a28a11709065f5099f001f8b6934')
sha256sums_x86_64=('2f3ac4790414308b1468cf2bfca4986c71593b26c9cfec39972524bd314a3ca4')
 
package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    mkdir -p "${pkgdir}/etc/ddns-go"
}

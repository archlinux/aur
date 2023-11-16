_pkgname=ddns-go
pkgname=${_pkgname}-bin
pkgver=5.6.6
pkgrel=1
pkgdesc='A simple, easy-to-use ddns service optimized for Chinese Mainland users'
license=('MIT')
arch=('x86_64' 'aarch64')
url="https://github.com/jeessy2/${_pkgname}"
provides=(${_pkgname})
conflicts=(${_pkgname})
source=(${_pkgname}.service ddns-go.install)
source_x86_64=("https://github.com/jeessy2/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("https://github.com/jeessy2/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums=('4a8086b2ef19c1c2f9c60f7cae5b852e6ce4a28a11709065f5099f001f8b6934'
            'e0279e548c66c0ff55b9a00e8dac834accafa4734b71891c3c63abdd93d9c97b')
sha256sums_x86_64=('a775044fb080e34fbcc60861ca2b590797a56776551fcff4524dd5be38fdaddc')
sha256sums_aarch64=('e63a6b4aa3161cbe7700c8d0a4922604bddfc2f40ff82d4309e9b4aa7baa681e')
install=ddns-go.install
 
package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    mkdir -p "${pkgdir}/etc/ddns-go"
}

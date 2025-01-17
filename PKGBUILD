_pkgname=ddns-go
pkgname=${_pkgname}-bin
pkgver="6.8.0"
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
source_armv7h=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv7.tar.gz")
# https://github.com/jeessy2/ddns-go/releases/download/v${pkgver}/checksums.txt
sha256sums=('4a8086b2ef19c1c2f9c60f7cae5b852e6ce4a28a11709065f5099f001f8b6934'
            'caf121192d465753c553163c8cd6fe56b3a5d27edf9fbce489bb3c1e7c27fe65')
sha256sums_x86_64=('1609e3191220087c7e509908d62d08cb6f2e9e2f10e0b99a45f250bdcc0b423b')
sha256sums_i686=('c107bba3b0d016b70e5da081bb362359174013e65ca3fd2970a4cad0d56e0afd')
sha256sums_i386=("${sha256sums_i686[0]}")
sha256sums_aarch64=('0f4fa3c21b057dcada1df73c4ae3cc269aa3d0dfaf48d6a124759e774014b60f')
sha256sums_armv7h=('c3902866ed40d3f5d602ee3b190f3f92307f17d0369e51b6cd8d7c658180fb01')
install=ddns-go.install

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    mkdir -p "${pkgdir}/etc/ddns-go"
    chmod 700 "${pkgdir}/etc/ddns-go"
}

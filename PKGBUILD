_pkgname=ddns-go
pkgname=${_pkgname}-bin
pkgver=3.7.1
pkgrel=1
pkgdesc='简单好用的DDNS。自动更新域名解析到公网IP(支持阿里云、腾讯云dnspod、Cloudflare、华为云)'
license=('MIT')
arch=('x86_64' 'i686' 'aarch64' 'armv6h')
url="https://github.com/jeessy2/${_pkgname}"
provides=(${_pkgname})
conflicts=(${_pkgname})
source=(${_pkgname}.service)
source_x86_64=("https://github.com/jeessy2/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz")
source_i686=("https://github.com/jeessy2/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_i386.tar.gz")
source_aarch64=("https://github.com/jeessy2/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_arm64.tar.gz")
source_armv6h=("https://github.com/jeessy2/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv6.tar.gz")
sha256sums=('c264ee5afaee8abed884cdd167f2e3281e08c3d74778790263163c114cd650d5')
sha256sums_x86_64=('9bd1ceabc43d6fa4c26523eb8297337e85e22e0e711aaaf5cfcaebd298cb1e84')
sha256sums_i686=('abcfcaed0f6804501f97d4a0e2d30feaa5319c14eac1afc3222db06a0245fa73')
sha256sums_aarch64=('b1864ac1567a72201e9cb0c06c7a059528c6b3569eca2c579155b2a08bb82647')
sha256sums_armv6h=('b49b236e26bdec88c6c7b16e1a9b8d75fed6ae4c35ebecb9270709a580a5b850')
 
package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
}


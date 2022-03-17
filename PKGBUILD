_pkgname=ddns-go
pkgname=${_pkgname}-bin
pkgver=3.5.0
pkgrel=1
pkgdesc='简单好用的DDNS。自动更新域名解析到公网IP(支持阿里云、腾讯云dnspod、Cloudflare、华为云)'
license=('MIT')
arch=('aarch64' 'x86_64' 'i686')
url="https://github.com/Icalingua/Icalingua"
provides=(${_pkgname})
conflicts=(${_pkgname})
source=(${_pkgname}.service)
source_x86_64=("https://github.com/jeessy2/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("https://github.com/jeessy2/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_arm64.tar.gz")
source_i686=("https://github.com/jeessy2/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_i386.tar.gz")

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
}
sha256sums=('c264ee5afaee8abed884cdd167f2e3281e08c3d74778790263163c114cd650d5')
sha256sums_aarch64=('239d331e021ac602c86d5965fca5c3b40346d513db18bc7414a9f7898e161c1c')
sha256sums_x86_64=('af2138691414c25fd4d4859c7a4d5c5ac661c611345655a1879e7fc2cb08a29a')
sha256sums_i686=('0e1d62f50034d0cbe5009225d2211a41f784578b3decb26c1c4fb0f7810c6ce2')

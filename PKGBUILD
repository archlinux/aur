_pkgname=ddns-go
pkgname=${_pkgname}-bin
pkgver=4.0.4
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
sha256sums_x86_64=('f97fef6a8aaa094425b34484c3779e43517efe19e5e7de8e886a448e7689448f')
sha256sums_i686=('f05d8a4ffaf6f50e3fd77c8375a4627a735bef051298ec3951195923b43d2421')
sha256sums_aarch64=('cc1cdf7be37f747ac3b7d86dd73fd12c7cd6302d38cf9bc742622151d1b8ae99')
sha256sums_armv6h=('2ab029f41b2581b7daa2a6331b54db14bd9785a5546f71340189e73b16f2515e')
 
package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
}


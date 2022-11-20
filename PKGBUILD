_pkgname=ddns-go
pkgname=${_pkgname}-bin
pkgver=4.2.1
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
sha256sums_x86_64=('ba4cb833230d1e356603771c60f10dcf1bda5ab49fa5eaca5b5494640820ad34')
sha256sums_i686=('df3ccdca7458f1ebd456ed4e9c72757fe60a3c81205529b78f37b113cfcbf408')
sha256sums_aarch64=('d5d90e96871bad98e0ad736442959111bcb11a543c8415f8dd0c319369c1838d')
sha256sums_armv6h=('46e8d5dd92b8b4795a90ef51802aaec8352bfd3e89609714cd4acb598553703d')
 
package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
}


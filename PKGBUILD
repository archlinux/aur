_pkgname=ddns-go
pkgname=${_pkgname}-bin
pkgver=4.5.6
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
sha256sums_x86_64=('6394b61ee9aa8177e0449422fde540c878f8e01fab6e213dcde4fb42d1310d20')
sha256sums_i686=('3aebfc4ff1b975712fd6ef857a9f8453e0d0448a762a7532044cc82f0d76b22e')
sha256sums_aarch64=('03eb311c4368bc68e1bb06bdee60e207092bee0b17479191f7c93bbd1d9caa02')
sha256sums_armv6h=('4bd3b282446bfa953df4174f92db59619c18583d95466413b2318b10cf771b9e')
 
package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
}


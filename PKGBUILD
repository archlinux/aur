# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: BryanLiang <liangrui.ch@gmail.com>
_pkgname=aliyunpan
pkgname="${_pkgname}-go-bin"
pkgver=0.3.4
pkgrel=1
pkgdesc='Aliyun disk command line client, support JavaScript plug-in, support synchronous backup function.阿里云盘命令行客户端,支持webdav文件服务,支持JavaScript插件,支持同步备份功能.(Precompiled version)'
arch=(
    'aarch64'
    'armv7h'
    'i686'
    'x86_64'
)
url='https://github.com/tickstep/aliyunpan'
license=('Apache-2.0')
depends=('bash')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-arm64.zip")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.zip::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-armv7.zip")
source_i686=("${pkgname%-bin}-${pkgver}-i686.zip::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-386.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-amd64.zip")
sha256sums_aarch64=('239946382b0379f8a36b3e745a497f77c1a36751ddcea6376a3c067f623f7a83')
sha256sums_armv7h=('e58c6a9fac8b26fc2dbeb0b2149eb32da02202feaa01446b94bbb2541f4e3aa8')
sha256sums_i686=('834aa7f5404aea247d1f36f71b7bfe9650fd6ab510b21bb9b1a0108473edb86f')
sha256sums_x86_64=('e3922c39b655b6dd562a3a78f425e6467390ef8aead4855e8c3b2d0c9783ac01')
package() {
    install -Dm755 "${srcdir}/${_pkgname}-v${pkgver}-linux-"*/"${_pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/${_pkgname}-v${pkgver}-linux-"*/webdav.sh "${pkgdir}/usr/bin/${_pkgname}-webdav"
    install -Dm755 "${srcdir}/${_pkgname}-v${pkgver}-linux-"*/sync.sh "${pkgdir}/usr/bin/${_pkgname}-sync"
    install -Dm644 "${srcdir}/${_pkgname}-v${pkgver}-linux-"*/manual.md -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}
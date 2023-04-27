# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ttf-maoken-unbounded-sans
pkgver=1.002
pkgrel=2
pkgdesc="无界黑-本字型是在 Dela Gothic One 的基础上补上简化字和简体中文常用字符。目前本字体支援 GB/T 2312 及元素周期表的元素名称。"
arch=(any)
url='https://www.maoken.com/unbound'
_githuburl='https://github.com/maoken-fonts/unbounded-sans'
license=(custom::OFL1.1)
depends=()
makedepends=()
source=("logo-${pkgname}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver}/LogoSCUnboundedSans.zip"
    "${pkgname}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver}/UnboundedSans.zip")
sha256sums=('276f9a3ccd5b07f00345766e35700d10ee8d33803dbb2483d9abb731d7d9cbb8'
            '5f8527bfb1a546a898fb6685fd8d69b03bcaf56dfcafdd8bebd4cd3689ce39ee')
package() {
    export LC_CTYPE="zh_CN.UTF-8"    
    install -Dm444 "${srcdir}/"*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
    install -Dm444 "${srcdir}/"OFL*.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
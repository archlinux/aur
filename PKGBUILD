# Maintainer: NekoLOvO <nekolyin@qq.com>

pkgname=com.qq.weixin.work.deepin
pkgver=4.1.32.6005deepin11~spark1
pkgrel=1
pkgdesc="Deepin Wine 版企业微信 | Deepin-wine Wecom"
arch=('i686' 'x86_64')
url="https://mirrors.sdu.edu.cn/spark-store-repository/store/chat/com.qq.weixin.work.deepin/"
license=('custom')
depends=('spark-dwine-helper')
source=(
    "${url}${pkgname}_${pkgver}_all.deb"
    "https://github.com/anthonyfok/fonts-wqy-microhei/raw/refs/heads/master/wqy-microhei.ttc"
)
sha256sums=('1f07ff1b1cc8b28f6dafea4278d6e1ea81171681a0a6f3684a0e701e3cb6f251'
            'e4bca8df123ce01b104780f576ea1a58b9a5ff1662a91124b6d3180cb6c88212')
install="wecom.install"

package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
    rm -rf "${pkgdir}/..deb"
    install -Dm644 "wqy-microhei.ttc" "${pkgdir}/usr/share/fonts/truetype/wqy/wqy-microhei.ttc"
    cp -rf ${pkgdir}/opt/apps/${pkgname}/entries/* "${pkgdir}/usr/share/"
}

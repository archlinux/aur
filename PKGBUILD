# Maintainer: NekoLOvO <nekolyin@qq.com>

pkgname=com.qq.weixin.work.deepin.gitee
pkgname_src=com.qq.weixin.work.swine
pkgver=4.1.20.6024spark3.1
pkgrel=2
pkgdesc="Deepin Wine 版企业微信 | Deepin-wine Wecom"
arch=('i686' 'x86_64')
url="https://mirrors.sdu.edu.cn/spark-store-repository/store/chat/com.qq.weixin.work.swine/"
license=('custom')
depends=('spark-dwine-helper')
source=(
    "${url}${pkgname_src}_${pkgver//_/-}_all.deb"
    "https://gitee.com/ai-zhe-teng/archlinux/raw/master/com.qq.weixin.work.deepin/wqy-microhei.ttc"
)
sha256sums=('4f81bb1be6d460e3f7490b333c0f424ddaa4b91f08b2646d2ea287f7c59808b7'
            'e4bca8df123ce01b104780f576ea1a58b9a5ff1662a91124b6d3180cb6c88212')
install="wecom.install"

package() {
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}/"
    install -Dm644 "wqy-microhei.ttc" "${pkgdir}/usr/share/fonts/truetype/wqy/wqy-microhei.ttc"
    cp -rf ${pkgdir}/opt/apps/${pkgname_src}/entries/* "${pkgdir}/usr/share/"
}

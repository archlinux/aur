# Maintainer: NekoLOvO <nekolyin@qq.com>

pkgname=com.qq.weixin.work.deepin.gitee
pkgname_src=com.qq.weixin.work.deepin
pkgver=5.0.0.6008~spark2
pkgrel=2
pkgdesc="Deepin Wine 版企业微信 | Deepin-wine Wecom"
arch=('i686' 'x86_64')
url="https://mirrors.sdu.edu.cn/spark-store-repository/store/chat/com.qq.weixin.work.deepin/"
license=('custom')
depends=('spark-dwine-helper')
source=(
    "${url}${pkgname_src}_${pkgver//_/-}_amd64.deb"
    "https://gitee.com/ai-zhe-teng/archlinux/raw/master/com.qq.weixin.work.deepin/wqy-microhei.ttc"
)
sha256sums=('a819cb384a06b28bff9e5460acf1f66767bed505f1323f67c7c22c2dc9410bcf'
            'e4bca8df123ce01b104780f576ea1a58b9a5ff1662a91124b6d3180cb6c88212')
install="wecom.install"

package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
    install -Dm644 "wqy-microhei.ttc" "${pkgdir}/usr/share/fonts/truetype/wqy/wqy-microhei.ttc"
    cp -rf ${pkgdir}/opt/apps/${pkgname_src}/entries/* "${pkgdir}/usr/share/"
}

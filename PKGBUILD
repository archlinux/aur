# Maintainer: NekoLOvO <nekolying@gmail.com>

pkgname=com.qq.weixin.work.deepin
pkgver=5.0.0.6008
pkgrel=1
pkgdesc="Deepin Wine 版企业微信 | Deepin-wine Wecom"
arch=('x86_64')
url="https://mirrors.sdu.edu.cn/spark-store-repository/store/chat/com.qq.weixin.work.deepin/"
license=('custom')
depends=(
    'spark-dwine-helper'
    'deepin-wine10-stable'
)
source=(
    "${url}${pkgname}_${pkgver}~spark2_amd64.deb"
    "https://github.com/anthonyfok/fonts-wqy-microhei/raw/refs/heads/master/wqy-microhei.ttc"
)
sha256sums=('a819cb384a06b28bff9e5460acf1f66767bed505f1323f67c7c22c2dc9410bcf'
            'e4bca8df123ce01b104780f576ea1a58b9a5ff1662a91124b6d3180cb6c88212')

package() {
    bsdtar -xf "${srcdir}/data.tar" -C "${pkgdir}/"
    rm -rf "${pkgdir}/.lock"
    install -Dm644 "wqy-microhei.ttc" "${pkgdir}/usr/share/fonts/truetype/wqy/wqy-microhei.ttc"
    cp -rf ${pkgdir}/opt/apps/${pkgname}/entries/* "${pkgdir}/usr/share/"
}

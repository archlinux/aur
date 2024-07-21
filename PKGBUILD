# Maintainer: maoyaotang <292898660@qq.com>
pkgname=cn.i4tools-bin
_pkgname=i4tools
pkgver=v3.05.010
pkgrel=1
pkgdesc='简单好用的多功能苹果设备管理助手。'
arch=('x86_64')
url="https://www.i4.cn/pro_pc.html"
license=('custom')
depends=('git')
source=(
    "i4tools_v3.05.010.rpm::https://d-updater.i4.cn/i4linux/deb/${_pkgname}_${pkgver}.rpm"
    "cn.i4Tools.desktop"
    "LICENSE.html::https://www.i4.cn/copyright.html"
)
sha256sums=(b437d24d72b58d5200da7ece16578df5f55053bf647a6e83828bbc429d090d56
            'c39f1408107cd69076a37d14326609fb8773717914b5ee335cb039e0bd66e1ed'
            'SKIP')

package() {
    install -m755 -d "${pkgdir}/opt/cn.i4Tools"
    install -m755 -d "${pkgdir}/usr/share/pixmaps"
    install -m755 -d "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -m755 -d "${pkgdir}/usr/bin"
    ln -s "/opt/cn.i4Tools/run.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 ../cn.i4Tools.desktop "$pkgdir"/usr/share/applications/cn.i4Tools.desktop 
    cp -r "${srcdir}/opt/apps/cn.i4Tools" "${pkgdir}/opt/"
    install -Dm644 ../LICENSE.html "$pkgdir/usr/share/licenses/$pkgname/LICENSE.html"
    cd "${srcdir}/opt/apps/cn.i4Tools/resources"
    cp logo.png "$pkgdir"/usr/share/pixmaps/i4tools.png
    cp logo.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/i4tools.svg       
}

# Maintainer: maoyaotang <292898660@qq.com>
pkgname=cn.i4tools-bin
_pkgname=i4tools
pkgver=v3.06.002
pkgrel=2
pkgdesc='简单好用的多功能苹果设备管理助手。'
arch=('x86_64')
url="https://www.i4.cn/pro_pc.html"
license=('custom')
depends=('git')
source=(
    "i4tools_v3.06.002.rpm::https://d-updater.i4.cn/i4linux/deb/${_pkgname}_${pkgver}.rpm"
    "cn.i4Tools.desktop"
    "LICENSE.html::https://www.i4.cn/copyright.html"
)
sha256sums=('1d3c09e1a595e6bf1e66e9e283656bee7975d0353cf9926f5c5deaaff19e7d3b'
            'c39f1408107cd69076a37d14326609fb8773717914b5ee335cb039e0bd66e1ed'
            'f3cc70ece76bae973291aa37ced5a48da64360ec4860e8549240a5f6cd3babd4')

package() {
    install -m755 -d "${pkgdir}/opt/cn.i4Tools"
    install -m755 -d "${pkgdir}/usr/share/pixmaps"
    install -m755 -d "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -m755 -d "${pkgdir}/usr/bin"
    ln -s "/opt/cn.i4Tools/run.sh" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 ../cn.i4Tools.desktop "$pkgdir"/usr/share/applications/cn.i4Tools.desktop 
    cp -r "${srcdir}/opt/apps/cn.i4Tools" "${pkgdir}/opt/"
    install -Dm644 ../LICENSE.html "$pkgdir/usr/share/licenses/$pkgname/LICENSE.html"
    cd "${srcdir}/opt/apps/cn.i4Tools/resources"
    cp logo.png "$pkgdir"/usr/share/pixmaps/i4tools.png
    cp logo.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/i4tools.svg       
}

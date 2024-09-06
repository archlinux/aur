# Maintainer: MYT1 <MYT1 @ QQ .com>
# Maintainer: i4 <admin@i4.cn>
# Maintainer: taotieren <admin@taotieren.com>
pkgname=i4tools-bin
_pkgname=i4tools
pkgver=3.06.006
_pkgver=v${pkgver}
pkgrel=2
pkgdesc='简单好用的多功能苹果设备管理助手。'
arch=('x86_64')
url="https://www.i4.cn/pro_pc.html"
license=('custom')
depends=(
    'bash'
    'brotli'
    'curl'
    'expat'
    'gcc-libs'
    'glib2'
    'glibc'
    'hicolor-icon-theme'
    'libffi'
    'libp11-kit'
    'openssl'
    'sqlite'
    'util-linux-libs'
    'zlib')
source=(
    "${_pkgname}_${_pkgver}.rpm::https://d-updater.i4.cn/i4linux/deb/${_pkgname}_${_pkgver}.rpm"
    "$_pkgname.desktop"
    "run.sh"
    "LICENSE.txt::https://www.i4.cn/copyright.html"
)
sha256sums=('298c9dc6543b837edbaa8ed7856b743d8cba179e3c1724d9ca7d7505d9e8fe98'
            'c39f1408107cd69076a37d14326609fb8773717914b5ee335cb039e0bd66e1ed'
            'b7fc9c90852ce99769fb31352e33d387cb8fe8ea3ec4c6a745c73cfd719020b7'
            'f3cc70ece76bae973291aa37ced5a48da64360ec4860e8549240a5f6cd3babd4')
package() {
    install -m755 -d "${pkgdir}/opt/cn.i4Tools"
    install -m755 -d "${pkgdir}/usr/share/pixmaps"
    install -m755 -d "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -m755 -d "${pkgdir}/usr/bin"
    install -Dm755 ${srcdir}/run.sh "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 ${srcdir}/$_pkgname.desktop "$pkgdir"/usr/share/applications/$_pkgname.desktop 
    cp -r "${srcdir}/opt/apps/cn.i4Tools" "${pkgdir}/opt/"
    install -Dm644 ${srcdir}/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cd "${srcdir}/opt/apps/cn.i4Tools/resources"
    cp logo.png "$pkgdir"/usr/share/pixmaps/$_pkgname.png
    cp logo.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg       
}

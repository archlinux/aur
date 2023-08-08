# Maintainer: Yunshan Yao <qimuzi@aliyun.com>
# Co-maintainer: 1ridic <i@8f.al>
pkgname=aliyunpan-odomu-bin
_appname=alixby
pkgver=3.23.80718
pkgrel=1
pkgdesc="binary of aliyunpan liupan1890 forked by odomu"
arch=("x86_64")
url="https://github.com/odomu/aliyunpan"
license=('custom')
depends=('pacman')
optdepends=()
provides=()
conflicts=("${pkgname%-bin}")
install=
source=(
    "${url}/releases/download/v${pkgver}/alixby-${pkgver}-linux-amd64.deb"
    alixby.desktop
)
sha256sums=('SKIP' 'SKIP')

package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    mv "${pkgdir}/opt/阿里云盘小白羊" "${pkgdir}/opt/alixby"  # change dir to english
    mv "${pkgdir}/usr/share/icons/hicolor/0x0/apps/alixby.png" "${pkgdir}/opt/alixby/" # move icon
    rm -rf "${pkgdir}/usr/share/" # delete
    install -Dm644 "${srcdir}/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"
    chmod 0755 "${pkgdir}/opt/alixby/alixby"
    
}

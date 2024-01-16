# Maintainer: Yunshan Yao <qimuzi@aliyun.com>
# Co-maintainer: 1ridic <i@8f.al>
pkgname=aliyunpan-odomu-bin
_appname=alixby
pkgver=3.24.11618
pkgrel=1
pkgdesc="binary of aliyunpan liupan1890 forked by odomu"
arch=("x86_64" "aarch64")
url="https://github.com/odomu/aliyunpan"
license=('custom')
depends=('pacman')
optdepends=()
provides=()
conflicts=("aliyunpan-gaozhangmin-bin")
install=
source_x86_64=("${url}/releases/download/v${pkgver}/alixby-${pkgver}-linux-x64.pacman" alixby.desktop)
sha256sums_x86_64=('a245c436bdbf8d27e79abd227f82b40b3fd3b868b9e8091863bc0c21b0da6050' '0535fce28ff22a20e919718c31d3e415600235a560a89fde34b62352ceeedf92')
source_aarch64=("${url}/releases/download/v${pkgver}/alixby-${pkgver}-linux-aarch64.pacman" alixby.desktop)
sha256sums_aarch64=('cc46dc1389eae3da8fc69faf9146ae1a521a3bc0868f4ee61f1f8a323b887a2c' '0535fce28ff22a20e919718c31d3e415600235a560a89fde34b62352ceeedf92')

package() {
    mkdir "$pkgdir/opt"
    mv "${srcdir}/opt/阿里云盘小白羊" "${pkgdir}/opt/alixby"  # change dir to english
    # mv "${pkgdir}/usr/share/icons/hicolor/0x0/apps/alixby.png" "${pkgdir}/opt/alixby/" # move icon
    rm .MTREE .INSTALL .PKGINFO
    rm -rf "${pkgdir}/usr/share/" # delete
    install -Dm644 "${srcdir}/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"
    chmod 0755 "${pkgdir}/opt/alixby/alixby"
    
}

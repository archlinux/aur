# Maintainer: three water threewaterzxm@gmail.com
# URL: https://github.com/chenmozhijin/LDDC
pkgname=lddc-bin
pkgver=0.9.2
pkgrel=2
license=(GPL3)
pkgdesc="简单易用的精准歌词(逐字歌词/卡拉OK歌词)下载匹配工具|A simple and user-friendly tool for downloading and matching precise lyrics (word-by-word lyrics/Karaoke lyrics)"
url="https://github.com/chenmozhijin/LDDC"
arch=('x86_64')
source=($url/releases/download/v${pkgver}/LDDC_${pkgver}_amd64.deb)
md5sums=('08e2af069ffeae670994961fc12b94ad')


package() {
    bsdtar -xpvf "${srcdir}/data.tar.zst"
    install -d "${pkgdir}/usr/share/applications/"
    install -d "${pkgdir}/usr/share/icons/"
    install -d "${pkgdir}/usr/lib/LDDC/"
    install -d "${pkgdir}/usr/bin/"

    # Program install 
    mv ${srcdir}/usr/lib/LDDC/* ${pkgdir}/usr/lib/LDDC/
    mv ${srcdir}/usr/bin/LDDC ${pkgdir}/usr/bin/

    # Desktop and icon install
    install -Dm644 "${srcdir}/usr/share/applications/LDDC.desktop" "${pkgdir}/usr/share/applications/LDDC.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/LDDC.ico" "${pkgdir}/usr/share/icons/LDDC.ico"
    
    # Change owner
    chown -R root:root "${pkgdir}/usr/lib/LDDC/"
    chown root:root "${pkgdir}/usr/bin/LDDC"
}

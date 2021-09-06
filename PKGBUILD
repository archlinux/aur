# Maintainer: ssfdust <ssfdust@gmail.com>
# Contributor: sukanka <su975853527@gmail.com>
pkgname=aliyunpan-liupan1890
url="https://github.com/liupan1890/aliyunpan"
pkgrel=1
pkgver=2.8.30
pkgdesc="阿里云盘小白羊版 阿里云盘PC版"
arch=("x86_64")
license=("None")
depends=('electron' 'aria2')
optdepends=('mpv: media preview support')
provides=("freechat")
source=("local://阿里小白羊版Linux v${pkgver}.zip"    # https://wwe.lanzoui.com/ivPlAtdn52h
        'aliyunpan-liupan1890.svg'
        'aliyunpan-liupan1890.desktop')
md5sums=('0d5019aa83cc0b97b39eaca1d3492886'
         'cfea225b67778e82b289f99e57b28c6f'
         '0d4e2a0c807b94f933d3b4826224f2cc')
options=(!strip)

package(){
    mkdir -p ${pkgdir}/opt/aliyunpan-liupan1890/
    cp ${srcdir}/阿里云盘小白羊版v2.8.30/electron/resources/{app.asar,app.ico,AppIcon.icns,app.png,aria2.conf} ${pkgdir}/opt/aliyunpan-liupan1890/
    chmod 644 ${pkgdir}/opt/aliyunpan-liupan1890/app.asar

    ln -s /usr/bin/aria2c ${pkgdir}/opt/aliyunpan-liupan1890/

    install -Dm644 ${srcdir}/aliyunpan-liupan1890.desktop -t ${pkgdir}/usr/share/applications/
    install -Dm644 ${srcdir}/aliyunpan-liupan1890.svg -t ${pkgdir}/usr/share/icons/
}

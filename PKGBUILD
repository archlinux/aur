# Maintainer: Sukanka <su975853527 [AT] gmail.com>

pkgname=qqmusic-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="tencent qq music"
arch=("x86_64")
url="https://y.qq.com/"
license=("CC0-1.0")
depends=('nss' 'libxss' 'gtk3' )
# currently upload files to this server, as the license is CC0-1.0
source=("qqmusic_${pkgver}_amd64.deb::https://share.ohthis.me/qqmusic/qqmusic_${pkgver}_amd64.deb")


sha512sums=('f9f926328cc83b32ce85469bedd1618d85a43f2e552f6f79dc57888f6f14854d3876165ee237ef122367920c9192a73e312d76400542522ed2a6f1bc4108dac4')

package(){
    cd ${srcdir}
    tar -xvf data.tar.xz -C "${pkgdir}"
    mv ${pkgdir}/opt/QQmusic   ${pkgdir}/opt/qqmusic
    
    mkdir -p "${pkgdir}"/usr/bin
    ln -s /opt/qqmusic/qqmusic "${pkgdir}"/usr/bin/qqmusic
    sed -i 's|Exec=/opt/QQmusic/qqmusic %U|Exec=qqmusic %U|g' $pkgdir/usr/share/applications/qqmusic.desktop 
}
 

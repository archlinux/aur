# Maintainer: Sukanka <su975853527 [AT] gmail.com>

pkgname=qqmusic-bin
pkgver=1.0.4
pkgrel=1
pkgdesc="tencent qq music"
arch=("x86_64")
url="https://y.qq.com/"
license=("CC0-1.0")
depends=('nss' 'libxss' 'gtk3' )
# currently upload files to this server, as the license is CC0-1.0
source=("qqmusic_${pkgver}_amd64.deb::https://share.ohthis.me/qqmusic/qqmusic_${pkgver}_amd64.deb")


sha512sums=('100cdf526c1d233eb457361c185a2b78521e01106e4272445f0cd9d1c7abc0cf25d358a5d7d6abec64ae5d1cd71a0ec7ab7a1980d605f3ab70485871ff6ff34f')

package(){
    cd ${srcdir}
    tar -xvf data.tar.xz -C "${pkgdir}"
    mv ${pkgdir}/opt/QQmusic   ${pkgdir}/opt/qqmusic
    
    mkdir -p "${pkgdir}"/usr/bin
    ln -s /opt/qqmusic/qqmusic "${pkgdir}"/usr/bin/qqmusic
    sed -i 's|Exec=/opt/QQmusic/qqmusic %U|Exec=qqmusic %U|g' $pkgdir/usr/share/applications/qqmusic.desktop 
}
 

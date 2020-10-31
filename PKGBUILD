# Maintainer: Sukanka <su975853527 [AT] gmail.com>

pkgname=qqmusic-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="tencent qq music"
arch=("x86_64")
url="https://y.qq.com/"
license=("CC0-1.0")
depends=('nss' 'libxss' 'gtk3' )
# currently upload files to this server, as the license is CC0-1.0
source=("qqmusic_${pkgver}_amd64.deb::https://share.ohthis.me/qqmusic/qqmusic_1.0.2_amd64.deb")


sha512sums=('bcae1b51317b4c68c3386df916536b5ae77445da7af94085cab05f4eb0d2971316c1fbaa98508147721f62adcbd136b91b3a9efbb93f8347f4abb07122a6168f')

package(){
    cd ${srcdir}
    tar -xvf data.tar.xz -C "${pkgdir}"
    mv ${pkgdir}/opt/QQmusic   ${pkgdir}/opt/qqmusic
    
    mkdir -p "${pkgdir}"/usr/bin
    ln -s /opt/qqmusic/qqmusic "${pkgdir}"/usr/bin/qqmusic
    sed -i 's|Exec=/opt/QQmusic/qqmusic %U|Exec=qqmusic %U|g' $pkgdir/usr/share/applications/qqmusic.desktop 
}
 

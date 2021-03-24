# Maintainer: Sukanka <su975853527 [AT] gmail.com>

pkgname=qqmusic-bin
_pkgname=qqmusic
pkgver=1.0.7
pkgrel=2
pkgdesc="tencent qq music"
arch=("x86_64")
url="https://y.qq.com/"
license=("CC0-1.0")
depends=('nss' 'libxss' 'gtk3' )
provides=("$_pkgname")
source=("qqmusic_${pkgver}_amd64.deb::http://dldir1.qq.com/music/clntupate/linux/deb/qqmusic_${pkgver}_amd64.deb")


sha512sums=('cb6813e0a349d1a4dbea85cfdf80e8555ecce8b60e6adea46d4e9532d8874669066a14af7a541039c1e0b599c897d12e144c1ae3a2f7aab5b12fd7fe4856bf03')

package(){
    cd ${srcdir}
    tar -xvf data.tar.xz -C "${pkgdir}"
    mv ${pkgdir}/opt/QQmusic   ${pkgdir}/opt/qqmusic
    
    mkdir -p "${pkgdir}"/usr/bin
    ln -s /opt/qqmusic/qqmusic "${pkgdir}"/usr/bin/qqmusic
    sed -i 's|Exec=/opt/QQmusic/qqmusic %U|Exec=qqmusic %U|g' $pkgdir/usr/share/applications/qqmusic.desktop 
    sed -i 's|QQmusic|qqmusic|g' $pkgdir/usr/share/applications/qqmusic.desktop 
}
 

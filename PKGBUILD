# Maintainer: Sukanka <su975853527 [AT] gmail.com>

pkgname=qqmusic-bin
_pkgname=qqmusic
pkgver=1.0.5
pkgrel=2
pkgdesc="tencent qq music"
arch=("x86_64")
url="https://y.qq.com/"
license=("CC0-1.0")
depends=('nss' 'libxss' 'gtk3' )
provides=("$_pkgname")
source=("qqmusic_${pkgver}_amd64.deb::http://dldir1.qq.com/music/clntupate/linux/deb/qqmusic_${pkgver}_amd64.deb")


sha512sums=('af5034d68807d50744157d239df07dd41bb2ce2e3045f05363956bc36aefda266cc99d85133eac2b33432666a9a71b43a531d88d7e12291b1a6f70bdc84287da')

package(){
    cd ${srcdir}
    tar -xvf data.tar.xz -C "${pkgdir}"
    mv ${pkgdir}/opt/QQmusic   ${pkgdir}/opt/qqmusic
    
    mkdir -p "${pkgdir}"/usr/bin
    ln -s /opt/qqmusic/qqmusic "${pkgdir}"/usr/bin/qqmusic
    sed -i 's|Exec=/opt/QQmusic/qqmusic %U|Exec=qqmusic %U|g' $pkgdir/usr/share/applications/qqmusic.desktop 
    sed -i 's|QQmusic|QQ音乐|g' $pkgdir/usr/share/applications/qqmusic.desktop 
    sed -i 's|QQMusic|QQ音乐|g' $pkgdir/usr/share/applications/qqmusic.desktop 
}
 

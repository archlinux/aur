# Maintainer: Sukanka <su975853527 [AT] gmail.com>

pkgname=qqmusic-bin
_pkgname=qqmusic
pkgver=1.1.1
pkgrel=2
pkgdesc="tencent qq music"
arch=("x86_64")
url="https://y.qq.com/"
license=("CC0-1.0")
depends=('nss' 'libxss' 'gtk3' )
provides=("$_pkgname")
source=("qqmusic_${pkgver}_amd64.deb::https://dldir1.qq.com/music/clntupate/linux/deb/qqmusic_${pkgver}_amd64.deb"
"qqmusic.asar::https://dl.sukanka.com/ali/software/qqmusic.asar"
)


sha512sums=('0b6b260aac960a8d0d92baf905d4f97e9d6e9227b196a4f43b9411e761d518e4f7e7b31058cca6ed92beb7542dddf0285911bb13c03cf5265ed1364f4b583308'
            'cfc6599410225af2299d35f855404dcea859fd6443f1c33b376ae45719e683df4782dc9c72f07924e8aa3b6a074321c5a86a7d3a9804ab9ab21a65a80edbef16')

package(){
    cd ${srcdir}
    tar -xvf data.tar.xz -C "${pkgdir}"
    
    mkdir -p "${pkgdir}"/usr/bin
    ln -s /opt/qqmusic/qqmusic "${pkgdir}"/usr/bin/qqmusic
    cd $pkgdir/usr/share/applications/
    sed -i '3c Exec=qqmusic %U'       qqmusic.desktop 
    sed -i 'N;2aName[zh_CN]=QQ音乐\nKeywords=qqmusic'      qqmusic.desktop 
    mv ${srcdir}/qqmusic.asar ${pkgdir}/opt/qqmusic/resources/app.asar
}
 

# Maintainer: Sukanka <su975853527 [AT] gmail.com>

pkgname=qqmusic-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="tencent qq music"
arch=("x86_64")
url="https://y.qq.com/"
license=("custom")
depends=('nss' 'libxss' 'gtk3' )
source=("qqmusic-${pkgver}.deb::https://development6.baidupan.com/102223bb/2020/10/22/85c79f9c3c40dc554dbd7a3faff63cfa.deb?st=dazLtNIsORrp3x5hbc9Kfw&e=1603382049&b=ASJbKlQ5A3NSdAc4V2QOVQBkWykDMgQsB2QMXgJkUT4ANg07UmZWfQc2AzBVZw_c_c&fi=31386566&pid=120-36-243-99&up=")


sha512sums=('f5fe5ddf2d5c71387507cfd673d9ecc417f4ed92170ddc8d82818e927c9eddaf61f421c0b3027360c7e291e83690f4f0a853e7607af8ee574c19f20e5cd804f7')

package(){
    cd ${srcdir}
    tar -xvf data.tar.xz -C "${pkgdir}"
    mv ${pkgdir}/opt/QQmusic   ${pkgdir}/opt/qqmusic
    
    mkdir -p "${pkgdir}"/usr/bin
    ln -s /opt/qqmusic/qqmusic "${pkgdir}"/usr/bin/qqmusic
    sed -i 's|Exec=/opt/QQmusic/qqmusic %U|Exec=qqmusic %U|g' $pkgdir/usr/share/applications/qqmusic.desktop 
}
 

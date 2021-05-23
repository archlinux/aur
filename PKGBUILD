# Maintainer: zhullyb <5435486@qq.com>

pkgname=purewriter-desktop-bin
pkgver=1.3.4
pkgrel=1
pkgdesc="Never loss content editor & Markdown"
arch=('x86_64')
url="https://writer.drakeet.com/desktop"
license=('Custom')
depends=('java-runtime>=11')
source=("https://github.com/PureWriter/desktop/releases/download/$pkgver/PureWriter-$pkgver-Linux-amd64.deb"
        'purewriter'
        'purewriter.png'
        'purewriter.desktop')
  
md5sums=('5d5b5837403fcd26fa372ddc39ebe266'
         'b61759ee70b9225f2a5738f724e5c480'
         'd24432d9cbba30b03c9f372405166ed9'
         '43d078956e3f3a981329e6233747a078')

prepare(){
    cd ${srcdir}
    tar -Jxvf data.tar.xz -C "${srcdir}"
}

package() {
    mkdir -p $pkgdir/usr/share/java/purewriter
    mv $srcdir/opt/pure-writer/lib/app/app.so $pkgdir/usr/share/java/purewriter/
    install -Dm755 purewriter $pkgdir/usr/bin/purewriter
    install -Dm644 purewriter.png "${pkgdir}"/usr/share/icons/hicolor/512x512/apps/purewriter.png
    install -Dm644 purewriter.desktop $pkgdir/usr/share/applications/purewriter.desktop
}

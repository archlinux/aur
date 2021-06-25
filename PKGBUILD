# Maintainer: zhullyb <5435486@qq.com>

pkgname=purewriter-desktop-bin
pkgver=1.3.4
pkgrel=2
pkgdesc="Never loss content editor & Markdown"
arch=('x86_64')
url="https://writer.drakeet.com/desktop"
license=('Custom')
depends=('jre-openjdk')
source=("https://github.com/PureWriter/desktop/releases/download/$pkgver/PureWriter-$pkgver-Linux-amd64.deb"
        'purewriter'
        'purewriter.png'
        'purewriter.desktop')
  
md5sums=('5d5b5837403fcd26fa372ddc39ebe266'
         '83e1149ce2ef7f29ad0e128d39e793b8'
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

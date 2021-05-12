# Maintainer: zhullyb <5435486@qq.com>

pkgname=purewriter-desktop-bin
pkgver=1.3.3
pkgrel=2
pkgdesc="Never loss content editor & Markdown"
arch=('x86_64')
url="https://writer.drakeet.com/desktop"
license=('Custom')
depends=('libxtst' 'freetype2' 'libxrender' 'java-runtime>=11' 'libnet' 'alsa-lib' 'zlib')
source=("https://github.com/PureWriter/desktop/releases/download/$pkgver/PureWriter-$pkgver-Linux-amd64.deb"
        'purewriter'
        'purewriter.png'
        'purewriter.desktop')
  
md5sums=('2bf7bbe1f16332d9fc1b721f1dd0e88e'
         '2c9a437895a327b625ead730ec3ec64e'
         'ab8d4aef028cd77876b8cf67e4439afb'
         '07bcca5a34e0dd58b40bb66b32b8dd5c')

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

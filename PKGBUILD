# Maintainer: zhullyb <zhullyb@outlook.com>

pkgname=deepin.com.qq.qqmusic
pkgver=17.66
pkgrel=2
pkgdesc="Tencent QQMusic Client on Deepin Wine"
arch=('i686' 'x86_64')
url="https://github.com/gorquan/QQMusic"
license=('custom')
depends=('deepin-wine5' 'p7zip')
source=("https://github.com/gorquan/QQMusic/releases/download/${pkgver}/qqmusic-${pkgver}-wine.deb")
sha256sums=('4152033ccd75f4bbde998570fcc02196288231c589223b4415d41f0b2a0841c8')
prepare() {
    bsdtar -xf "$srcdir"/data.tar.xz
}
package() {
    cd "$srcdir"
    mv opt usr "$pkgdir"
    sed -i 's|Categories=media;|Categories=AudioVideo;Player;|' $pkgdir/usr/share/applications/qqmusic.desktop
    sed -i 's|deepin-wine|deepin-wine5|' $pkgdir/opt/deepinwine/apps/Deepin-QQMusic/run.sh
}

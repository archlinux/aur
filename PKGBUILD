# Maintainer: ambition-echo <ambition_echo@outlook.com>

pkgname=earth-wallpaper-bin
appid=cn.huguoyang.earthwallpaper
name=earth-wallpaper
resname=earth_wallpaper
pkgver=2.1.8
pkgrel=0
pkgdesc="Simple and easy to use multifunctional wallpaper software 简单好用的多功能壁纸软件"
arch=('x86_64')
url="https://github.com/ambition-echo/earth_wallpaper"
license=('GPL3')
depends=('dbus-python' 'python' 'python-pillow' 'python-requests' 'pyside6' 'python-pysocks')

source=(
    "$name-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
    "$name.desktop"
    )
sha256sums=(
    'SKIP'
    '13d8de079c942b804123b8eea64034bb2e7bb8bcc6563b5a4406ee7089dd1db5'
    )

package() {
    install -Dm644 ./$name.desktop $pkgdir/usr/share/applications/$name.desktop
    cd $srcdir/$resname-$pkgver
    mkdir -p $pkgdir/opt/$pkgname/$resname
    cp -r $resname/* $pkgdir/opt/$pkgname/$resname
    chmod +x $pkgdir/opt/$pkgname/$resname/main.py
    sed -i "s/return \".*/return \"$pkgver\"/g" $pkgdir/opt/$pkgname/$resname/about.py
}

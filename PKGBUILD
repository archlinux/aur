# Maintainer: FlyInWind <2518509078@qq.com>

pkgname=navicat15-premium-cs
pkgver=15.0.28
pkgrel=1
pkgdesc="Navicat Premium is a multi-connection database development tool. (Chinese Simplified)"
arch=(x86_64)
url='https://www.navicat.com/en/navicat-15-highlights'
license=('GPL3')
source=(
    # The download url always download latest version
    "navicat15-premium-cs-${pkgver}.AppImage::http://download.navicat.com.cn/download/navicat15-premium-cs.AppImage"
    'navicat15.desktop'
)
sha256sums=(
    'a3cce552c00a5eb1c07b99c9ca59e470abe96d75c481a592a631b4262b4f8d5d'
    '2c69105cc3ceda6075e36ebfd2931f1a023929045c18087a0a4504c0e5c4a4a1'
)

package() {
    _root_na_dir=opt/$pkgname
    _na_dir=$pkgdir/$_root_na_dir
    install -d $_na_dir/usr

    cd $srcdir
    cp -r usr/{bin,lib,plugins} $_na_dir/usr
    install AppRun $_na_dir
    cp manual.pdf $_na_dir
    cp cacert.pem $_na_dir

    install -d $pkgdir/usr/share/applications
    cp navicat15.desktop $pkgdir/usr/share/applications

    _icon_dir=usr/share/icons/hicolor/256x256/apps
    install -d $pkgdir/$_icon_dir
    cp $_icon_dir/navicat-icon.png $pkgdir/$_icon_dir/navicat15.png
}

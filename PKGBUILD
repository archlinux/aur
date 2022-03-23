# Maintainer: FlyInWind <2518509078@qq.com>

pkgname=navicat16-premium-cs
pkgver=16.0.9
pkgrel=1
pkgdesc="Navicat Premium is a multi-connection database development tool. (Chinese Simplified)"
arch=(x86_64)
url='https://www.navicat.com/en/navicat-16-highlights'
license=('GPL3')
source=(
    # The download url always download latest version
    "navicat16-premium-cs-${pkgver}.AppImage::https://download.navicat.com.cn/download/navicat16-premium-cs.AppImage"
    'navicat16.desktop'
)
sha256sums=(
    '26a413c0421e196de2d3ebea4cddb16ae96696d9716c1c6d315a9279f4eb7992'
    'b53285c7999e8c2141e1060c2513425e7dfc617372096e2001efe5de6ffbf8ab'
)

package() {
    _root_na_dir=opt/$pkgname
    _na_dir=$pkgdir/$_root_na_dir
    install -d $_na_dir

    cd $srcdir
    cp -r usr $_na_dir
    install AppRun $_na_dir
    cp manual.pdf $_na_dir

    install -d $pkgdir/usr/share/applications
    cp $srcdir/navicat16.desktop $pkgdir/usr/share/applications

    _icon_dir=usr/share/icons/hicolor/256x256/apps
    install -d $pkgdir/$_icon_dir
    ln -s /$_root_na_dir/$_icon_dir/navicat-icon.png $pkgdir/$_icon_dir/navicat16.png
}

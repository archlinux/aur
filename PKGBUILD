# Maintainer: FlyInWind <2518509078@qq.com>

pkgname=navicat15-premium-cs
pkgver=15.0.22
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
    'b23c49d87a6ca41b7fc620408d866ba23a2c7526dfaaf730578da84f088470c6'
    '6477d39b5c6247a6e5769fb65ac99504ba602170794f5610a1e301cd0832032e'
)

package() {
    _root_na_dir=opt/$pkgname
    _na_dir=$pkgdir/$_root_na_dir
    install -d $_na_dir

    cd $srcdir
    cp -r usr $_na_dir
    install AppRun $_na_dir
    cp manual.pdf $_na_dir
    cp cacert.pem $_na_dir

    install -d $pkgdir/usr/share/applications
    cp $srcdir/navicat15.desktop $pkgdir/usr/share/applications

    _icon_dir=usr/share/icons/hicolor/256x256/apps
    install -d $pkgdir/$_icon_dir
    ln -s /$_root_na_dir/$_icon_dir/navicat-icon.png $pkgdir/$_icon_dir/navicat15.png
}

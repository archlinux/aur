# Maintainer: ninjia <z.ninjia@gmail.com>

pkgname=navicat16-premium-en
pkgver=16.0.11
pkgrel=1
pkgdesc="Navicat Premium is a multi-connection database development tool. ( English )"
arch=(x86_64)
url='https://www.navicat.com/en/navicat-16-highlights'
license=('GPL3')
source=(
    # The download url always download latest version
    "navicat16-premium-en.AppImage::https://github.com/nninjia/navicat16-premium-en-aur/releases/download/v16.0.11/navicat16-premium-en.AppImage"
    'navicat16.desktop'
)
sha256sums=(
    '3c80375a87f82dfb35fba4027d67137ced651d8ae27e9e27e4959e45fb377665'
    '4b3c9b2ab589fcfe703244b25b18891cd9be0c39f66eabaaa20f1e70f8957d11'
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

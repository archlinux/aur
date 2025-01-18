# Maintainer: kokononine <nine_9@outlook.jp>
pkgname=ugee-tablet
pkgver=4.3.4
_pkgver_sub1=20241217
_pkgver_sub2=241031
pkgrel=2
pkgdesc='Ugee Tablet Driver(version 4.x)'
url='https://www.ugee.com.cn/download/'
source=("https://download.ugee.com.cn/upload/download/$_pkgver_sub1/ugeeTablet-$pkgver-$_pkgver_sub2.tar.gz")
arch=('x86_64')
license=('custom: commercial')
depends=()
#depends=('libx11' 'libxrender' 'libxrandr' 'libxinerama' 'libxtst' 'libsm' 'libice' 'libglvnd' 'libusb' 'freetype2' 'qt5-x11extras' 'hicolor-icon-theme')
optdepends=()
conflicts=()
provides=()
#options=()
install="PKGBUILD"
sha256sums=('83c51feb0d0a1e68e7f443665a68c8dab1fb41c72ec993c045ee465f839dd2ff')

package()
{
    install -d "$pkgdir/usr"
    install -d "$pkgdir/usr/lib"
    install -d "$pkgdir/etc"

    cp -r "$srcdir/ugeeTablet-$pkgver-$_pkgver_sub2/App/usr" "$pkgdir"
    cp -r "$srcdir/ugeeTablet-$pkgver-$_pkgver_sub2/App/lib" "$pkgdir/usr"
    cp -r "$srcdir/ugeeTablet-$pkgver-$_pkgver_sub2/App/etc" "$pkgdir"
}

post_install()
{
    echo -en ":: \033[1m\033[33mA reboot is required after the installation!\033[0m\n"
}

post_upgrade()
{
    post_install
}

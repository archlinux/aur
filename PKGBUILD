# Maintainer: kokononine <nine_9@outlook.jp>
pkgname=ugee-tablet
pkgver=4.3.4
_pkgver_sub1=20240820
_pkgver_sub2=240704
pkgrel=1
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
sha256sums=('21975425aae9fd861e93324110cb434d0758b54e994fc874d4e3982f152a46e7')

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

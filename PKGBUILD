# Maintainer: AnoGP <anogp at pm dot me>

pkgname=motionbox
_pkgname=motionbox
pkgver=1.6.0.6
pkgrel=1
pkgdesc="MotionBox is a Video Browser for Motion Freedom"
arch=("x86_64")
url="http://omega.gg/MotionBox/"
license=("GPL3")
provides=("motionbox")
conflicts=("motionbox")
depends=(vlc qt5-base libidn11)
source=(
    http://omega.gg/get/MotionBox/MotionBox-1.6.0-linux64.tar.gz
    https://github.com/G-P-L/AUR/raw/master/MotionBox/MotionBox.desktop
    https://github.com/G-P-L/AUR/raw/master/MotionBox/MotionBox.png
)
sha256sums=('1ad9b893830428c7fa1cffe243219ed614e87bf3ae6ae3befb920ef038177006'
            'c531f06e8777a2f6327ead793b6dc16c2b4780fdb16be354f8e68ddbe32138e7'
            '7b0f4fb92e7bc5d23fbef1a0bb9381a63fa979f28a36b2f0b4b4619b13039b72')

package() {
    install -d "$pkgdir/opt/MotionBox"
    install -d "$pkgdir/usr/bin"

    # copy application icon
    install -Dm644 MotionBox.png "$pkgdir/opt/MotionBox/MotionBox.png"

    # copy desktop launcher
    install -Dm644 MotionBox.desktop "$pkgdir/usr/share/applications/MotionBox.desktop"

    cp -r "$srcdir/MotionBox-1.6.0/"{backend,documents,imageformats,libboost_chrono.so.1.65.1,libboost_random.so.1.65.1,libboost_system.so.1.65.1,libcrypto.so.1.1,libdouble-conversion.so.1,libharfbuzz.so.0,libicudata.so.60,libicui18n.so.60,libicuuc.so.60,libpng16.so.16,libQt5Core.so.5,libQt5DBus.so.5,libQt5Gui.so.5,libQt5Network.so.5,libQt5OpenGL.so.5,libQt5Qml.so.5,libQt5Quick.so.5,libQt5Svg.so.5,libQt5Widgets.so.5,libQt5XcbQpa.so.5,libQt5XmlPatterns.so.5,libQt5Xml.so.5,libssl.so.1.1,libtorrent-rasterbar.so.9,libxcb-xinerama.so.0,libz.so.1,platforms,QtQuick.2,Readme.html,start.sh,MotionBox,xcbglintegrations} "$pkgdir/opt/MotionBox/"

    # ln -s /usr/lib/libvlc.so.5 $pkgdir/opt/MotionBox/libvlc.so.5
    # ln -s /usr/lib/vlc $pkgdir/opt/MotionBox/vlc
    ln -s /opt/MotionBox/start.sh $pkgdir/usr/bin/motionbox
}

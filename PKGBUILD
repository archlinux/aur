# Maintainer: AnoGP <anogp at pm dot me>

pkgname=motionbox
_pkgname=motionbox
pkgver=1.6.0
pkgrel=1
pkgdesc="Video browser and player created by bunjee for the Omega Movement"
arch=("x86_64")
url="http://omega.gg/MotionBox/"
license=("GPL3")
provides=("motionbox")
conflicts=("motionbox")
depends=(vlc qt5-base)
source=(
    http://omega.gg/get/MotionBox/MotionBox-1.6.0-linux64.tar.gz
    https://github.com/G-P-L/AUR/raw/master/MotionBox/MotionBox.desktop
    https://github.com/G-P-L/AUR/raw/master/MotionBox/MotionBox.png
    https://github.com/G-P-L/AUR/raw/master/MotionBox/libdouble-conversion.so.1
)
sha256sums=(
'e2ef85abac7c4ed527f43ca5361b2485b45beff0c913636abc8c9f752e8ef683'
'c531f06e8777a2f6327ead793b6dc16c2b4780fdb16be354f8e68ddbe32138e7'
'7b0f4fb92e7bc5d23fbef1a0bb9381a63fa979f28a36b2f0b4b4619b13039b72'
'4306f334766de8c464f232504614f3511161a4705dc7a7820dc2644e9c4741d2'
)

package() {
    install -d "$pkgdir/opt/MotionBox"
    
    # copy application icon
    install -Dm644 MotionBox.png "$pkgdir/opt/MotionBox/MotionBox.png"
    
    # copy desktop launcher
    install -Dm644 MotionBox.desktop "$pkgdir/usr/share/applications/MotionBox.desktop"
    
    # copy libdouble-conversion.so.1, which is needed for the application to run
    install -Dm644 libdouble-conversion.so.1 "$pkgdir/opt/MotionBox/libdouble-conversion.so.1"
    
    chmod +x $srcdir/MotionBox-1.6.0/MotionBox
    
    cp -r "$srcdir/MotionBox-1.6.0/"{documents,imageformats,libboost_chrono.so.1.65.1,libboost_random.so.1.65.1,libboost_system.so.1.65.1,libcrypto.so.1.1,libharfbuzz.so.0,libicudata.so.60,libicui18n.so.60,libicuuc.so.60,libpng16.so.16,libQt5Core.so.5,libQt5DBus.so.5,libQt5Gui.so.5,libQt5Network.so.5,libQt5OpenGL.so.5,libQt5Qml.so.5,libQt5Quick.so.5,libQt5Svg.so.5,libQt5Widgets.so.5,libQt5XcbQpa.so.5,libQt5XmlPatterns.so.5,libQt5Xml.so.5,libssl.so.1.1,libtorrent-rasterbar.so.9,libxcb-xinerama.so.0,libz.so.1,MotionBox,platforms,QtQuick.2,Readme.html,start.sh,xcbglintegrations} "$pkgdir/opt/MotionBox/"
}

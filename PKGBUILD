pkgname=motionbox-bin
_pkgname=motionbox-bin
pkgver=1.6.0.12
majver=1.6.0
subver=12
pkgrel=3
pkgdesc="MotionBox is a Video Browser for Motion Freedom"
arch=("x86_64")
url="http://omega.gg/MotionBox/"
license=("GPL3")
provides=("motionbox")
conflicts=("motionbox")
depends=(vlc qt5-base libidn11)
source=(
    https://s3-eu-west-1.amazonaws.com/omega.gg/get/MotionBox/MotionBox-$majver-$subver-linux64.tar.gz
    https://github.com/G-P-L/AUR/raw/master/MotionBox/MotionBox.desktop
    https://github.com/G-P-L/AUR/raw/master/MotionBox/MotionBox.png
)
sha256sums=('8758068919dee6b01ad7d99cac7acbe7c0dc129bea5eef30be52ef513fb8cca0'
            'c531f06e8777a2f6327ead793b6dc16c2b4780fdb16be354f8e68ddbe32138e7'
            '7b0f4fb92e7bc5d23fbef1a0bb9381a63fa979f28a36b2f0b4b4619b13039b72')

package() {
    install -d "$pkgdir/opt/MotionBox"
    install -d "$pkgdir/usr/bin"

    # Copy files and folders from the source tarball to /opt/MotionBox/.
    mv "$srcdir/MotionBox-$majver-$subver/" "$srcdir/MotionBox/"
    cp -r "$srcdir/MotionBox/" "$pkgdir/opt/"

    # Copy application icon to /opt/MotionBox/.
    install -Dm644 MotionBox.png "$pkgdir/opt/MotionBox/MotionBox.png"

    # Copy desktop launcher to /usr/share/applications/.
    install -Dm644 MotionBox.desktop "$pkgdir/usr/share/applications/MotionBox.desktop"

    # Link binary to /usr/bin/.
    ln -s /opt/MotionBox/start.sh $pkgdir/usr/bin/motionbox
}

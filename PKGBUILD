# Maintainer: M4rQu1Nh0S <zonadomarquinhos@gmail.com>

pkgname=xdman
pkgver=5.0.47
pkgrel=2
pkgdesc="Xtreme Download Manager is a powerful tool to increase download speed up-to 500%, save videos from video sharing sites and integration with ANY browser."
arch=('i686' 'x86_64')
url="http://xdman.sourceforge.net/"
depends=('java-runtime')
license=('GPL')

if [ "$CARCH" = "i686" ]; then
source=("http://sourceforge.net/projects/xdman/files/xdm-jre-32bit.tar.xz"
        "xdman.desktop"
        "xdman"
        "xdman.png")
md5sums=('1db7d588dddc7f6e4c7a4f1d4a8e73e3'
         '1b2a4cb985ab317c7a95fbcf92b333a0'
         'b13a41ca08969f5f18ab421d1ecceb8c'
         'b4f527e7b9f5a884cdffd4d38612170b')

elif [ "$CARCH" = "x86_64" ]; then
source=("http://sourceforge.net/projects/xdman/files/xdm-jre-64bit.tar.xz"
        "xdman.desktop"
        "xdman"
        "xdman.png")
md5sums=('00096f8c8a50f93c9f4d02687474e9b0'
         '1b2a4cb985ab317c7a95fbcf92b333a0'
         'b13a41ca08969f5f18ab421d1ecceb8c'
         'b4f527e7b9f5a884cdffd4d38612170b')
fi

build() {
rm -f "$srcdir/xdm/jre" --recursive
}

package() {
install -D -m644 "../xdman.desktop" "$pkgdir/usr/share/applications/xdman.desktop"
install -D -m775 "../xdman" "$pkgdir/usr/bin/xdman"
install -D -m644 "../xdman.png" "$pkgdir/usr/share/pixmaps/xdman.png"
install -D -m644 "$srcdir/xdm/xdm.jar" "$pkgdir/usr/share/java/xdm/xdman.jar"
}

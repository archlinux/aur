# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=jd-gui-bin
_pkgname=jd-gui
pkgver=1.4.0
pkgrel=5
pkgdesc='A standalone graphical utility that displays Java source codes of .class files'
arch=('any')
url='http://jd.benow.ca/'
license=('GPL3')
depends=('java-runtime')
provides=('jd-gui')
conflicts=('jd-gui')
source=(
  "https://github.com/java-decompiler/jd-gui/releases/download/v${pkgver}/${_pkgname}-${pkgver}.jar"
  "https://github.com/java-decompiler/jd-gui/raw/v${pkgver}/src/linux/resources/jd_icon_128.png"
  "jd-gui"
  "jd-gui.desktop"
)

package() {
	cd "$srcdir"
  install -Dm644 "$_pkgname-$pkgver.jar" "$pkgdir/usr/share/java/$_pkgname/$_pkgname.jar"
  install -d "$pkgdir/usr/bin"
  install -Dm755 "$srcdir/jd-gui" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 jd-gui.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 jd_icon_128.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"
}

sha512sums=('04f59d0ec974009ca5141f7f7229862d8e084f7ecc5685825e2fa10c8539c56f5a81252f3c80e344453c75050b8fa0dc5fd5cb6b4bb9c6b845bac86ed31899e0'
            '767c54d4147e5d223ffa453a3094d8f7f8a33832d1c92cd8a189fd8fbaa7dec00767a5ff8e29caf295de65780b0745e062f796c4aa2d8ab368b1fe20e03ff3b2'
            '841923ce9643da5396564806d79bf3e8f56310c138351c5c5850c97ee38f1d112915426fd45746ed9ffd88054bab2ef696bd2e15d56fa00424c92fce69851a42'
            '9ddb8521c1791f5d3251f012e30b7d6aaa48b509e02af628f3b8a90fb6ba176de3f79fbfbec316c86c1594ac142ca4d85bcffff7ea8f0fba6f926ea78cd1f81d')

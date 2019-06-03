# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=jd-gui-bin
_pkgname=jd-gui
pkgver=1.5.2
pkgrel=1
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

sha512sums=('55537f3c277ef9011f6e0d4464a8701f101225f3391b229536a955ac23279b8f3743599671b79433e87abc8514f8f68ffc782e556734b3630654ab95cf3533a2'
            '767c54d4147e5d223ffa453a3094d8f7f8a33832d1c92cd8a189fd8fbaa7dec00767a5ff8e29caf295de65780b0745e062f796c4aa2d8ab368b1fe20e03ff3b2'
            'd073054480e06c9f124605bdbc5cee775e067115592f46bbcea2650d363b81f453b8e1a5e818a685eff7ba166631ebc79d14dc72e2d1dfae102f4cdf05188933'
            '9ddb8521c1791f5d3251f012e30b7d6aaa48b509e02af628f3b8a90fb6ba176de3f79fbfbec316c86c1594ac142ca4d85bcffff7ea8f0fba6f926ea78cd1f81d')

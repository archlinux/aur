# Maintainer: Eric Ozwigh <ozwigh at gmail dot com>
# Contributor: Baobab <eternal.baobab@gmail.com>
# Contributor: watsonalgas <watsonalgas@gmail.com>

pkgname=cronometer
pkgver=0.9.9
pkgrel=2
pkgdesc="A fully featured nutrition and biomarker tracking tool"
arch=('any')
url="http://sourceforge.net/projects/cronometer"
license=('CPL')
depends=("java-environment")
source=("http://downloads.sourceforge.net/project/cronometer/cronometer/${pkgver}/CRONoMeter-${pkgver}-MacOSX.zip"
        "cronometer.sh"
        "cronometer.desktop"
        "cronometer.png")
sha1sums=('b650a9c7602e8859e84a9b05f8f92e8d6b0b23f1'
          'a0bd6614e7dc32a39792267d0b2a4b0f19af7038'
          '0386c93e407e4d3a76751de467e8ad955cf3e318'
          '8c18222595d299489e203c9124c62095da9c3431')

package() {
    install -d $pkgdir/usr/share/java/$pkgname
    install -m644 $srcdir/CRONoMeter.app/Contents/Resources/Java/*.jar $pkgdir/usr/share/java/$pkgname
    install -D -m755 $srcdir/cronometer.sh $pkgdir/usr/bin/cronometer
    install -D -m644 $srcdir/cronometer.desktop $pkgdir/usr/share/applications/cronometer.desktop
    install -D -m644 cronometer.png $pkgdir/usr/share/pixmaps/cronometer.png
}

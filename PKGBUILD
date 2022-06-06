# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Moritz Schoenherr <moritz.schoenherr[at]gmail[dot]com>
# Contributor: Lawrence González <pentestian [at] airmail [dot] cc>
pkgname=ysoccer
pkgver=19
pkgrel=1
pkgdesc='Soccer game in the style of Sensible Soccer'
url='https://ysoccer.sourceforge.net/'
arch=('any')
license=('GPL2')
depends=('java-runtime' 'bash' 'hicolor-icon-theme')
source=("https://master.dl.sourceforge.net/project/$pkgname/YSoccer19/$pkgname$pkgver.zip"
        'ysoccer.sh' 'ysoccer.desktop')
sha256sums=('17ed9e1083570ec58ce72adc2c7e22e43b9538dc5efbfe792dcf319f523e2e9c'
            'd127da36a791db4ca372935551dfa5a919ddc744e597f6c22dc1ad7074c4aa28'
            'db6554a93ab690876e7594022d467e68fc23458904144cdbed5b5482fedfda19')

package() {
  cd "$srcdir"
  install -D ysoccer.sh "$pkgdir/usr/bin/ysoccer"
  install -D ysoccer.jar "$pkgdir/usr/share/java/$pkgname/ysoccer.jar"
  install -D ysoccer.desktop "$pkgdir/usr/share/applications/ysoccer.desktop"

  mkdir -p "$pkgdir/usr/share/$pkgname" "$pkgdir/usr/share/doc" \
           "$pkgdir/usr/share/icons/hicolor/128x128/apps" \
           "$pkgdir/usr/share/icons/hicolor/32x32/apps"
  cp -r images music sounds data i18n configs "$pkgdir/usr/share/$pkgname"
  cp -r docs "$pkgdir/usr/share/doc/$pkgname"
  cp images/icon_128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/ysoccer.png"
  cp images/icon_32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/ysoccer.png"
}

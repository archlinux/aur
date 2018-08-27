# Maintainer: Sammay Sarkar <smmysrkr@gmail.com>
pkgname=jave-beta
pkgver=6.0rc2
pkgrel=1
pkgdesc='Java Ascii Versatile Editor'
arch=('any')
url='http://www.jave.de'
license=('custom:CPL')
depends=('java-runtime')
provides=('jave')
source=("${pkgname}-${pkgver}.zip::http://www.jave.de/developer/jave_6.0_RC2.zip"
        "license.html::http://www.eclipse.org/legal/cpl-v10.html"
        "jave.sh"
        "jave.desktop")
package() {
  cd "$srcdir"
  install -dm755 $pkgdir/usr/share/jave
  install -Dm755 jave.sh $pkgdir/usr/bin/jave
  install -Dm644 {,$pkgdir/usr/share/licenses/jave/}license.html
  install -Dm644 {,$pkgdir/usr/share/applications/}jave.desktop
  install -Dm644 icons/javeicon.png $pkgdir/usr/share/pixmaps/jave.png
  rm {jave.{bat,sh,desktop},"$pkgname-$pkgver.zip",license.html}
  mv "$srcdir" -T $pkgdir/usr/share/jave
}

md5sums=('e044ca82cbd25ce2ed87b617a0d2dc29'
         'SKIP'
         '864e22ea9faa856f5ab9bbaef88a1ad8'
         'f83b8c47668639aa0418b3bd2ffacb57')

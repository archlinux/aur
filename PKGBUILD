pkgname=ttf-trigger
pkgver=20120316
pkgrel=2
pkgdesc="Chrono Trigger font collection"
arch=(any)
url="http://www.chronocompendium.com"
license=("Creative Commons")
depends=(fontconfig xorg-font-utils)
makedepends=(dos2unix)
source=("http://chronofan.com/Black/Other/trigger.zip"
"http://chronofan.com/Black/Other/trigger_bold.zip"
"http://chronofan.com/Black/Other/trigger_light.zip"
"http://chronofan.com/Black/Other/trigger_mono.zip")
md5sums=('f9946ff4446602e64acc295e8212ff8e'
         '825fc6c713564a14ca84f5ad188a3ecb'
         '827d1c841802fb44fede3ac94350868c'
         '19b16be7acba147db6453e751d3dd632')
install=$pkgname.install

prepare() {
	dos2unix "$srcdir/license.txt"
}

package() {
  install -Dm644 "$srcdir/trigger.ttf" "$pkgdir/usr/share/fonts/TTF/trigger.ttf"
  install -m644 "$srcdir/trigger_bold.ttf" "$pkgdir/usr/share/fonts/TTF/"
  install -m644 "$srcdir/trigger_light.ttf" "$pkgdir/usr/share/fonts/TTF/"
  install -m644 "$srcdir/trigger_mono.ttf" "$pkgdir/usr/share/fonts/TTF/"
  install -Dm644 "$srcdir/license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}

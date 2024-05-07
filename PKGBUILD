# Maintainer: Zahrun <zahrun [at] murena.io>
# Submitter:  Yannik Stein <yannik.stein [at] gmail.com>

pkgname=rhythmbox-tray-icon-git
pkgrel=4
pkgver=3abf81c
pkgdesc="Restores the tray icon functionality from the 0.x series."

arch=('any')
url="http://github.com/mendhak/rhythmbox-tray-icon"
license=('GPL3')
provides=('rhythmbox-tray-icon')
conflicts=('rhythmbox-tray-icon')
depends=('rhythmbox>=2.90')
makedepends=('git' 'unzip')

source=("$pkgname::git+https://github.com/mendhak/rhythmbox-tray-icon.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --always | sed 's|-|.|g'
}

package() {
  cd $pkgname
  mkdir -p $pkgdir/usr/lib/rhythmbox/plugins
  unzip -u rhythmbox-tray-icon.zip -d $pkgdir/usr/lib/rhythmbox/plugins
}

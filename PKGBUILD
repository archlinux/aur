# Maintainer: Bernhard Landauer <oberon@manjaro.org>

pkgname=solarized-dark-themes
pkgver=20160109
pkgrel=1
_repo=solarized-dark-xfce
_snapshot=55e38bc45586f389532acaac789ad482ca8de10d
pkgdesc="Dark solarized GTK2/3, openbox, metacity, unity, xfwm4 and xfce4-terminal themes"
url="https://github.com/mzgnr/$_repo"
license=('GPL-3.0+')
arch=('any')
depends=('gtk-engine-murrine')
conflicts=('gtk-theme-numix-solarized')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_snapshot.tar.gz")
md5sums=('3a99e1121e390303aa730dd7a694337b')

package() {
  cd $_repo-$_snapshot/xfce-theme
  mkdir -p $pkgdir/usr/share/themes
  cp -r * $pkgdir/usr/share/themes

  cd ../xfce-terminal
  install -Dm 644 terminalrc $pkgdir/usr/share/xfce4/terminal/terminalrc
}

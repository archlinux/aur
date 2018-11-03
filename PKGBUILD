# Maintainer: Julian Thonhauser <julthon@gmail.com>
pkgname=gnome-mojave-timed-wallpaper
pkgver=v3
pkgrel=1
pkgdesc="Gnome time based mojave wallpaper"
url="https://github.com/julthon/gnome-mojave-timed-wallpaper"
arch=(any)
depends=(gnome-shell gnome-backgrounds)
source=("$pkgname-$pkgver.tar.gz::https://github.com/julthon/gnome-mojave-timed-wallpaper/releases/download/$pkgver/gnome-mojave-timed-wallpaper_$pkgver.tar.gz")
sha512sums=('17b049b5f5d423cce3c458caafef48dac05b6768f574370ced9621e73d52f37d7c1984292db2b96408ff982d613da88daa80c7a6c55abf11465b16901387607f')

package() {
  _instdir="$pkgdir/usr/share/backgrounds/gnome/"
  _bgpropdir="$pkgdir/usr/share/gnome-background-properties"
  mkdir -p $_instdir $_bgpropdir
  cp -dpr --no-preserve=ownership "$srcdir/mojave" $_instdir
  cp -dp --no-preserve=ownership "$srcdir/mojave-timed.xml" "$_instdir"
  cp -dp --no-preserve=ownership "$srcdir/mojave.xml" "$_bgpropdir/mojave.xml"
}


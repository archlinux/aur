# Maintainer: Julian Thonhauser <julthon@gmail.com>
pkgname=gnome-mojave-timed-wallpaper
pkgver=v4
pkgrel=2
pkgdesc="GNOME time based Mojave wallpaper"
url="https://github.com/julthon/gnome-mojave-timed-wallpaper"
arch=(any)
depends=(gnome-shell gnome-backgrounds)
source=("$pkgname-$pkgver.tar.gz::https://github.com/julthon/gnome-mojave-timed-wallpaper/releases/download/$pkgver/gnome-mojave-timed-wallpaper_$pkgver.tar.gz")
sha512sums=('374e8321eadf0318afba972b781d11bb035d49b202e12513ffa9e76df299a3c1d80ae2c8dc6aca7b90924e3c4612ff1b32b14deb9d6ba978fe4490f421e0f109')

package() {
  _instdir="$pkgdir/usr/share/backgrounds/gnome/"
  _bgpropdir="$pkgdir/usr/share/gnome-background-properties"
  mkdir -p $_instdir $_bgpropdir
  cp -dpr --no-preserve=ownership "$srcdir/mojave" $_instdir
  cp -dp --no-preserve=ownership "$srcdir/mojave-timed.xml" "$_instdir"
  cp -dp --no-preserve=ownership "$srcdir/mojave.xml" "$_bgpropdir/mojave.xml"
}


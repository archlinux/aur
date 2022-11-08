# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-randomwallpaper
_pkgname=RandomWallpaperGnome3
pkgver=2.7.2
pkgrel=1
pkgdesc="Fetch a random wallpaper from an online source and set it as a desktop background.  The desktop background can be updated periodically or manually."
arch=('any')
url="https://github.com/ifl0w/RandomWallpaperGnome3"
license=('MIT')
depends=('gnome-shell')
makedepends=('zip')
source=(${url}/archive/v$pkgver.tar.gz)
b2sums=('608d577aa2a69b35a0ea7c5286a32f0242561f5104e48ac9b3abdd5bdc25255e15eb595fe027e69a3e5c9d04675699b21e13f978fe9b625ce8c34adcb2c14666')

build() {
  cd "${_pkgname%-git}-$pkgver"

  ./build.sh
}

package() {
  cd "${_pkgname%-git}-$pkgver"

  uuid=randomwallpaper@iflow.space
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
  bsdtar -xvf ${uuid}.zip -C "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
}

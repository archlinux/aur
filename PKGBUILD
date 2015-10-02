# Maintainer: Marcel Hoppe <hoppe.marcel@gmail.com>
# https://github.com/solus-cold-storage/evopop-gtk-theme/

_gituser=solus-cold-storage
_gitname=evopop-gtk-theme

pkgname=evopop-gtk-theme
pkgbase=${pkgname}
pkgver=0.29
pkgrel=1
pkgdesc='GTK theme from Solus OS and Budgie Desktop'
arch=('any')
url="https://github.com/$_gituser/$_gitname"
license=('GPL')
conflicts=('evopop-gtk-theme-git')
depends=('gtk3' 'gtk-engine-murrine')
provides=('evopop-gtk-theme' 'evopop-light-gtk-theme')
source=("https://github.com/$_gituser/$_gitname/releases/download/$pkgver/$_gitname-$pkgver.tar.xz")
md5sums=('7336450f3b2d7fe20c5088ed14b989d5')

package() {
  cd "$srcdir/$_gitname-$pkgver"
  DESTDIR="$pkgdir/usr/share/themes"
  mkdir -p $DESTDIR
  DIR=$(cat evopop-gtk-theme/index.theme | grep -Po "(?<=Name=).*")
  DIR_LIGHT=$(cat evopop-light-gtk-theme/index.theme | grep -Po "(?<=Name=).*")
	cp -r evopop-gtk-theme $DESTDIR/$DIR
	cp -r evopop-light-gtk-theme $DESTDIR/$DIR_LIGHT
}

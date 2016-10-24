# Maintainer: Marcel Hoppe <hoppe.marcel@gmail.com>
# https://github.com/solus-cold-storage/evopop-gtk-theme/

_gituser=solus-cold-storage
_gitname=evopop-gtk-theme

pkgname=evopop-gtk-theme
pkgbase=${pkgname}
pkgver=2.0.4
pkgrel=1
pkgdesc='GTK theme from Solus OS and Budgie Desktop'
arch=('any')
url="https://github.com/$_gituser/$_gitname"
license=('GPL')
conflicts=('evopop-gtk-theme-git')
depends=('gtk3' 'gtk-engine-murrine')
provides=('evopop-gtk-theme' 'evopop-light-gtk-theme')
source=("https://github.com/$_gituser/$_gitname/archive/$pkgver.tar.gz")
sha1sums=('db493129c3dfb1a64c6a13e3a0a36903e02023cd')


package() {
  cd "$srcdir/$_gitname-$pkgver"
  DESTDIR="$pkgdir/usr/share/themes"
  mkdir -p "$DESTDIR"
	cp -r EvoPop "$DESTDIR/"
	cd "$DESTDIR/EvoPop"
	ln -s gtk-3.20 gtk-3.0
}

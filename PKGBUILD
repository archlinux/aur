# Maintainer: Marcel Hoppe <hoppe.marcel@gmail.com>
# https://github.com/solus-cold-storage/evopop-gtk-theme/

_gituser=solus-project
_gitname=evopop-gtk-theme

pkgname=evopop-gtk-theme
pkgbase=${pkgname}
pkgver=2.9.99
pkgrel=1
pkgdesc='GTK theme from Solus OS and Budgie Desktop'
arch=('any')
url="https://github.com/$_gituser/$_gitname"
license=('GPL')
conflicts=('evopop-gtk-theme-git')
depends=('gtk3' 'gtk-engine-murrine')
provides=('evopop-gtk-theme' 'evopop-azure-gtk-theme')
source=("https://github.com/$_gituser/$_gitname/archive/$pkgver.tar.gz")
sha256sums=('4f59ca6a9e80006082294d1dc43e2d5727b7c28b94d7077c77a0762f2f95f262')

build() {
  cd "$srcdir/$_gitname-$pkgver"
  ./autogen.sh
  make
}

package() {
  cd "$srcdir/$_gitname-$pkgver"
  DESTDIR="$pkgdir/usr/share/themes"
  mkdir -p "$DESTDIR"
	cp -r EvoPop "$DESTDIR/"
  cp -r EvoPop-Azure "$DESTDIR/"
}

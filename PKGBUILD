# Maintainer: Marcel Hoppe <hoppe.marcel@gmail.com>
# https://github.com/solus-cold-storage/evopop-icon-theme/

_gituser=solus-cold-storage
_gitname=evopop-icon-theme

pkgname=evopop-icon-theme
pkgbase=${pkgname}
pkgver=0.8
pkgrel=2
pkgdesc='Icon theme from Solus OS and Budgie Desktop'
arch=('any')
url="https://github.com/$_gituser/$_gitname"
license=('GPL')
source=("https://github.com/$_gituser/$_gitname/releases/download/$pkgver/EvoPop-$pkgver.tar.xz")
md5sums=('bdea87c89ea45bcf32d8fd6b116f0b84')

package() {
  cd "$srcdir/EvoPop-$pkgver/EvoPop"
  DESTDIR="$pkgdir/usr/share/icons/"
  DIR=$(cat ./index.theme | grep -Po "(?<=Name=).*")
  mkdir -p $DESTDIR/$DIR
	cp -r * $DESTDIR/$DIR
}

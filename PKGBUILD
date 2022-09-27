# Maintainer: Cassandra Watergate (saltedcoffii) <cassandrajwatergate@gmail.com>

_pkgname=gnome-shell-extension-notes
pkgname=$_pkgname
pkgver=23
pkgrel=1
pkgdesc="A GNOME Shell extension providing customizable sticky notes on the desktop"
arch=('any')
url="https://github.com/maoschanz/notes-extension-gnome"
license=('GPL-3')
depends=('gnome-shell')
makedepends=('glib2')
source=($pkgname-$pkgver.tar.gz::https://github.com/maoschanz/notes-extension-gnome/archive/23.tar.gz)
sha256sums=('92174a83643eb8c256d80ecd58844c0976c159d862aac5cb16d89b295566767b')

_gitsrcdir=notes-extension-gnome

build() {
  cd $_gitsrcdir-$pkgver
  ./update-and-compile-translations.sh --all
  glib-compile-schemas notes@maestroschan.fr/schemas
}

package() {
  cd $_gitsrcdir-$pkgver
  mkdir -p $pkgdir/usr/share/gnome-shell/extensions
  cp --recursive --no-dereference --preserve=mode,links notes@maestroschan.fr $pkgdir/usr/share/gnome-shell/extensions
}

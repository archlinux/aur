# Maintainer: Jonathan Apodaca <jrapodaca@gmail.com>
pkgname=uuallpaper-git
pkgver=0.0.1
pkgrel=3
pkgdesc="A wallpaper switcher for GNOME powered by Unsplash."
arch=('x86_64')
url="https://gitlab.com/jrop/$pkgname"
license=('MIT')
makedepends=('git' 'go')
source=("$pkgname::git+https://gitlab.com/jrop/uuallpaper.git#branch=master")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
}

build() {
  cd "$srcdir/$pkgname"
  go build -o "$pkgname" .
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/uuallpaper"
  # Install other project files like documentation or configuration as needed
}
# vim: filetype=sh

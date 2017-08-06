# Maintainer: Tim Hellhake

pkgname="k810-conf"
_pkgname="k810_conf"
pkgver=0.1
pkgrel=9
pkgdesc="Logitech K810 Keyboard Configurator, change function keys (F-keys) behavior. Read USAGE at https://aur.archlinux.org/cgit/aur.git/tree/README.md?h=k810-conf"
arch=("i686" "x86_64")
url="http://www.trial-n-error.de/posts/2012/12/31/logitech-k810-keyboard-configurator"
license=("Unkown")
backup=("etc/udev/rules.d/10-k810-conf.rules")
install=install
source=(
  "http://blog.chschmid.com/media/${_pkgname}-v${pkgver}.tar.bz2"
  "10-k810-conf.rules")
md5sums=('858a8de02d5b8db27e4da22833b54d20'
         '7b619f8949cbc4d7ee85f8459967ad2a')

build() {
	cd "$srcdir"

  gcc -o k810-conf k810_conf.c
}

package() {
	cd "$srcdir"

  install -D -m755 k810-conf "$pkgdir/usr/bin/k810-conf"
  install -D -m644 10-k810-conf.rules "$pkgdir/etc/udev/rules.d/10-k810-conf.rules"
}

# Maintainer: Radoslav Georgiev <rgeorgiev583@gmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: hellwoofa (at arcor dot de)
pkgname=xbindkeys_config-gtk2
_pkgname=xbindkeys_config
pkgver=0.1.4
pkgrel=1
pkgdesc="XBindKeys_Config is an easy to use gtk program for configuring Xbindkeys. GTK2 version. "
arch=(i686 x86_64)
url="https://github.com/rgeorgiev583/xbindkeys_config"
license=('GPL')
depends=('xbindkeys' 'gtk2')
source=(https://github.com/rgeorgiev583/xbindkeys_config/archive/v0.1.4.tar.gz)
sha512sums=('e0032408934dc26a2745d5774a41f9af7528a12fbf17e59acd03de57c00a6e2ebf54c8d6fefdf308af7a406aeef4eaa4294deb9c54ee4ad6f84bd5de5e3c5d1c')

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	mkdir -p $pkgdir/usr/bin
	make DESTDIR="$pkgdir" install
}

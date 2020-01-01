# Maintainer: Ryan McKeown <ryanmckeown at mail4me dot com>
# Contributor: Ben Lawrence <ben at accountable2you dot com>
pkgname=accountable2you-bin
pkgver=1.84
pkgrel=2
pkgdesc='Accountable2You client application'
arch=('any')
url='https://accountable2you.com'
license=('unknown')
depends=('wmctrl' 'python37' 'gtk3' 'libappindicator-gtk3' 'gobject-introspection')
provides=('accountable2you')
conflicts=('accountable2you')
install='accountable2you-bin.install'
source=('https://secure.accountable2you.com/linux/deb/accountable2you-1.84p37.zip')
md5sums=('e10e305b2163511ad5e6653d0ea396d1')

prepare() {
	ar x accountable2you*.deb
}
package() {
	tar -xvf data.tar.xz -C "$pkgdir"
	sed -i 's|python3|python3.7|g' "$pkgdir"/usr/bin/accountable2you
}

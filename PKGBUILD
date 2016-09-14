# Maintainer: Urjeet Patel <violentmagician.opensource@gmail.com>
pkgname=vlevel-git
pkgver=0.5.1
pkgrel=1
pkgdesc="VLevel is a tool to amplify the soft parts of music so you don't have to fiddle with the volume control."
arch=('i686' 'x86_64')
url="https://github.com/radiocicletta/vlevel"
license=('GPLv2')
depends=()
makedepends=('git')
source=('git+https://github.com/radiocicletta/vlevel.git')

md5sums=('SKIP')

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	mkdir -p "$pkgdir"/usr/{bin,lib/ladspa,}
	cd "$srcdir/${pkgname%-git}/vlevel-bin"
	install -D vlevel-bin "$pkgdir"/usr/bin

	cd "$srcdir/${pkgname%-git}/vlevel-jack"
	install -D vlevel-jack "$pkgdir"/usr/bin

	cd "$srcdir/${pkgname%-git}/vlevel-ladspa"
	install -D vlevel-ladspa.so "$pkgdir"/usr/lib/ladspa

	cd "$srcdir/${pkgname%-git}/vlevel-ladspa"
	install -D vlevel-ladspa.so "$pkgdir"/usr/lib/ladspa
}

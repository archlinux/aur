# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Mister.Bubbles <http://crbserver.net>
# Contributor: daemonTutorials <http://www.daemon-tuts.de>
pkgname=wii-u-gc-adapter
pkgver=0.0.29
pkgrel=2
pkgdesc="Tool for using the Wii U GameCube Adapter on Linux"
arch=('i686' 'x86_64')
url="https://github.com/ToadKing/wii-u-gc-adapter"
source=('git+https://github.com/ToadKing/wii-u-gc-adapter.git' '51-ignore-gc-controller.conf')
sha512sums=('SKIP'
            '6e3ca9aabd8732f5ab5220e249a7d789067b8014bbc0cbbd790f6afac04957662ad844aab70680139cfb6079fc1b28cb6fe0e664f46c13401cf068a632403dac')

pkgver() {
	cd "$srcdir"/wii-u-gc-adapter
	echo -n 0.0.
	git rev-list --count HEAD
}

build() {
	cd "$srcdir"/wii-u-gc-adapter
	make
}

package() {
	install -Dm755 "$srcdir"/wii-u-gc-adapter/wii-u-gc-adapter "$pkgdir"/usr/bin/wii-u-gc-adapter
	install -Dm644 "$srcdir"/51-ignore-gc-controller.conf "$pkgdir"/usr/share/X11/xorg.conf.d/51-ignore-gc-controller.conf
}

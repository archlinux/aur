# Maintainer: Strahinya Radich <contact@strahinja.org>
pkgname=sled
pkgver=0.12.7
pkgrel=1
pkgdesc="Simple text editor"
arch=('x86_64')
url="https://strahinja.srht.site/sled"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~strahinja/sled/archive/v$pkgver.tar.gz")
md5sums=('cd5a6c2a3f59f887bb5b11703652f6db')

build() {
	cd $pkgname-v$pkgver

	# Example on how to apply patches: dark theme patch (uncomment last
	# line in this paragraph)
	# Using "git am" instead would require setting up git identity
	#git apply patch/dark-theme.patch

	# Example on how to disable configuration options: turn off wrap
	# (uncomment next line)
	#sed -i 's,^\(#define ENABLE_WRAP\),//\1,' config.h

	FALLBACKVER=$pkgver-$pkgrel PREFIX="$pkgdir/usr" make -e all
}

package() {
	cd $pkgname-v$pkgver
	FALLBACKVER=$pkgver-$pkgrel PREFIX="$pkgdir/usr" make -e install
}

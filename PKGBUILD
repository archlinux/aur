# Maintainer: Mads Kjeldgaard<mail@madskjeldgaard.dk>
pkgname=jack-xruntotal-git
pkgver=r13.adba33d
pkgrel=1
pkgdesc='Simple xrun counter for jack, useful for status bars'
arch=('any')
url='https://github.com/madskjeldgaard/jack_xruntotal'
license=('GPL')
groups=('pro-audio')
depends=('jack')
makedepends=('git')
optdepends=()
source=("$pkgname-$pkgver"::git+$url.git
        )
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname-$pkgver"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}


package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 ./jack_xruntotal $pkgdir/usr/bin/jack_xruntotal
}


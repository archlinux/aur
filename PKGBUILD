# Maintainer: Mads Kjeldgaard<mail@madskjeldgaard.dk>
pkgname=folderkit-git
pkgver=1
pkgrel=1
pkgdesc='An OSC sampler useable with orca'
arch=('any')
url='https://codeberg.org/nonmateria/folderkit'
license=('GPL')
groups=('pro-audio')
depends=('liblo-git')
makedepends=('git')
optdepends=()
source=("$pkgname-$pkgver"::git+$url.git)
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
}


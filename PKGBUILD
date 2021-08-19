# Maintainer: Mads Kjeldgaard<mail@madskjeldgaard.dk>
pkgname=supercollider-mkfaustplugins-git
pkgver=r12.15969fd
pkgrel=2
pkgdesc='SuperCollider plugins written in Faust'
arch=('any')
url='https://github.com/madskjeldgaard/mkfaustplugins'
license=('GPL')
groups=('pro-audio' 'supercollider-plugins')
depends=('supercollider')
makedepends=('git' 'cmake' 'faust' 'ruby-rexml')
optdepends=()
source=("$pkgname"::git+$url.git)
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
		cd "$srcdir/$pkgname/"
		make install
}


package() {

	DEST="$pkgdir/usr/share/SuperCollider/Extensions"
	cd "$srcdir/$pkgname"

	mkdir -p "$DEST"
	cp -r -av "install/MKFaustPlugins" "$DEST"

}


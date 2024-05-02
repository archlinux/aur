# Maintainer: Utkarsh Kr. Singh <utkarshkrsingh@proton.me>
pkgname='clirun'
pkgver=1
pkgrel=1
#epoch=
pkgdesc="cli based code runner whenever the file is modified"
arch=('x86_64')
url="https://github.com/utkarshkrsingh/clirun"
license=('BSD2')
#groups=()
#depends=()
makedepends=('git')
#checkdepends=()
#optdepends=()
#provides=()
#conflicts=()
#replaces=()
#backup=()
#options=()
#install=
#changelog=
#source=("$pkgname-$pkgver.tar.gz"
#        "$pkgname-$pkgver.patch")
source=('clirun::git+https://github.com/utkarshkrsingh/clirun.git')
#noextract=()
sha256sums=('SKIP')
#validpgpkeys=()

#prepare() {
#	cd "$pkgname-$pkgver"
#	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
#}

build() {
	cd "$pkgname"
	make
}

#check() {
#	cd "$pkgname-$pkgver"
#	make -k check
#}

package() {
	cd "$pkgname"
	install -Dm755 ./clirun "$pkgdir/usr/bin/clirun"
    install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname"
}

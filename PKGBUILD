# Contributor: Kazuo Teramoto <kaz.rag gmail com>
# Contributor: scj <scj archlinux us>
# Contributor: tracer <jcdenton513 gmail com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=orpie
pkgver=1.5.2
pkgrel=9
epoch=
pkgdesc="A console-based RPN (reverse polish notation) desktop calculator."
arch=('i686' 'x86_64')
url="http://pessimization.com/software/orpie/"
license=('GPL')
groups=()
depends=('ncurses' 'gsl')
makedepends=('ocaml' 'gsl' 'camlp4')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://pessimization.com/software/orpie/${pkgname}-${pkgver}.tar.gz")
noextract=()
md5sums=('1fd02e75549cca954cebbd13271ea7f5')
sha1sums=('9786df20fb272fd36f87868bed04cab504602282')
sha256sums=('de557fc7f608c6cb1f44a965d3ae07fc6baf2b02a0d7994b89d6a0e0d87d3d6d')

build() {
	cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr --mandir=/usr/share/man --sysconfdir=/etc
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install

    install -Dm644 doc/manual.pdf $pkgdir/usr/share/doc/$pkgname/manual.pdf
}


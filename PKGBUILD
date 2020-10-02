# Contributor: Paolo Herms
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=frama-c
_codename=Scandium
pkgver=21.1
pkgrel=1
epoch=1
pkgdesc='Extensible platform dedicated to source-code analysis of C software.'
arch=('i686' 'x86_64')
license=('LGPL2.1')
url='http://frama-c.com'
depends=('gtksourceview2' 'libgnomecanvas' 'ocaml-zarith')
makedepends=('lablgtk2' 'coq' 'graphviz' 'ltl2ba' 'ocaml' 'ocaml-ocamlgraph' 'ocaml-findlib' 'ocaml-num' 'ocaml-yojson')
optdepends=('lablgtk2' 'coq' 'graphviz' 'ltl2ba')
source=("http://frama-c.com/download/${pkgname}-${pkgver}-${_codename}.tar.gz")
md5sums=('44ae60236da19b3ed7d28d476575643d')
sha1sums=('da75116dfd7927681388b34d38d56704eb0ae0ef')
sha256sums=('be25105521d40eeb2872b3dc2d46b2f67dca2b6e3546ed65ab0de4df10680063')
sha512sums=('57562f7f9779f040fd12a881b358383a495990f9cdc0da6d03799591ece291710a1805e32eb0cac1703974edd090a6999a2940a84f3247204715c497e4235ab5')

build() {
	cd "$srcdir/$pkgname-$pkgver-$_codename"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver-$_codename"
	make DESTDIR="$pkgdir" install
}

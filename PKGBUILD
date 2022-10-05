# Maintainer: Laura Demkowicz-Duffy <dev@demkowiczduffy.co.uk>
pkgname=savilerow-bin
_pkgname=savilerow
pkgver=1.9.1
pkgrel=1
pkgdesc="A modelling assistant for Constraint Programming"
arch=('x86_64')
url="https://savilerow.cs.st-andrews.ac.uk/"
license=('custom')
depends=('java-runtime')
provides=('savilerow')
source=("https://savilerow.cs.st-andrews.ac.uk/$_pkgname-$pkgver-linux.tgz"
		"savilerow.sh")
noextract=("savilerow.sh")
sha256sums=('6dab7b95c0889732f881b32ab359ba090f0d8c622d4aea50432b89007128a770'
            'a26d063017332f8aa2960fc4bd2713d3087f13ce1f9c29366f35135f26a43ffd')

package() {
	cd "$srcdir"

	mkdir -p "$pkgdir/opt"
	cp -r "$_pkgname-$pkgver-linux" "$pkgdir/opt/$_pkgname"
	install -Dm0755 "$srcdir/savilerow.sh" "$pkgdir/usr/bin/savilerow"
}

# Maintainer: Armando Ibarra <armandoibarra1@gmail.com>
# Contributor: flaketill <armandoibarra1 at gmail dot com>

pkgname=flaketill-says
pkgver=0.0.1
pkgrel=2

pkgdesc="An app for your console to proyects manager, for example if you write on your \
console application flaketill says: What do yo do? In 
the future i'll build an app like jarvis but for moment is a dream"
arch=('x86_64')
url="https://artpcweb.appspot.com/"
license=('GPL')

depends=('python2' 'espeak')
checkdepends=('gdb')
makedepends=('lxterminal' 'terminator' 'namcap')
optdepends=('gksu: sudo-save support',
			'alsa-lib: sound support')

#source_x86_64=("https://raw.githubusercontent.com/flaketill/flaketill-says/testing/dist/aur/flaketill-says")

install=${pkgname}.install

#source=("$pkgname-$pkgver.tar.gz"
#        "$pkgname-$pkgver.patch")

source=("${pkgname}.desktop"
		"$pkgname")

md5sums=('ccc2acc3cf18f71c517e42fc2eb4d77b')

package() {

	make DESTDIR="$pkgdir/" install

	install -dm755 "${pkgdir}/usr/share/applications"

	install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
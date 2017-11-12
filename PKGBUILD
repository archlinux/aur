# Maintainer: Jérôme Deuchnord <contact@deuchnord.tk>
pkgname=deuchnord-hermes
pkgver=0.7
pkgrel=2
pkgdesc="A warranties manager (currently only in French)"
arch=('i686' 'x86_64')
url="https://www.deuchnord.fr/projets/hermes"
license=('custom:MIT')
depends=('qt5-base' 'sane' 'imagemagick')
makedepends=('qt5-base')
source=("https://github.com/Deuchnord/Hermes/archive/v0.7.tar.gz")
sha256sums=('ab695a70decb496c91ec51fec274388cda503aa7304e4bf7a80f5a2701f7862e')

build() {
	cd Hermes-0.7
	make
}

package() {
	cd "$srcdir/Hermes-0.7"
	mkdir -p $pkgdir/usr/bin $pkgdir/usr/share/icons $pkgdir/usr/share/applications
	cp deuchnord-hermes $pkgdir/usr/bin
	cp icon-hermes.png $pkgdir/usr/share/icons/deuchnord-hermes.png
	cp ../../deuchnord-hermes.desktop $pkgdir/usr/share/applications
}

# Maintainer: Kris McCleary <kris27mc@gmail.com>

pkgname=fortune-mod-rickandmorty
pkgver=10.09.2017
pkgrel=1
pkgdesc="Fortune quotes from Rick and Morty. GOTTA GET SCHWIFTY"
arch=('any')
license=('custom:cc-sa-3.0')
url="http://en.wikiquote.org/wiki/Rick_and_Morty"
depends=('fortune-mod')
makedepends=('fortune-mod' 'make' 'coreutils' 'wikiquote-fortune>=1.4')

build()
{
	wikiquote-fortune Rick_and_Morty
	mv quotes rickandmorty
	strfile rickandmorty
}

package()
{
	install -dm755 -- "${pkgdir}/usr/share/fortune"
    install -m644 -- rickandmorty rickandmorty.dat "${pkgdir}/usr/share/fortune"
}

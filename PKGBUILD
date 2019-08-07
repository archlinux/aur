# Maintainer: Peven Phoon <iampeven@gmail.com> 

pkgname=perl-regexp-debugger
pkgver=0.002001
pkgrel=1
pkgdesc="Regexp::Debugger - Visually debug regexes in-place"
arch=('any')
url="https://metacpan.org/pod/Regexp::Debugger"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.1')
source=("https://cpan.metacpan.org/authors/id/D/DC/DCONWAY/Regexp-Debugger-0.002001.tar.gz")
sha256sums=('2b618fa60e4e9f78d982d2dd51087cdae1e75103b2239ccb16d2dc6a961a4fbd')

build() {
	cd "${srcdir}/Regexp-Debugger-${pkgver}"
	/usr/bin/perl Makefile.PL
	make
}

check() {	
	cd "${srcdir}/Regexp-Debugger-${pkgver}"
	make test	
}

package() {
	cd "${srcdir}/Regexp-Debugger-${pkgver}"
	make install DESTDIR="${pkgdir}"
}

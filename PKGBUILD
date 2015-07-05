# Maintainer: gls < ghostlovescorebg at gmail dot com >

pkgname=perl-event-rpc
pkgver=1.05
pkgrel=1
pkgdesc="Event based transparent Client/Server RPC framework."
_dist=Event-RPC
url="http://search.cpan.org/~jred/${_dist}-${pkgver}"
license="GPL PerlArtistic"
depends=('perl')
arch=('any')
options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/J/JR/JRED/${_dist}-${pkgver}.tar.gz")
md5sums=('fd6e257b922dea322f72efae8a756592')

build() {

	cd ${srcdir}/${_dist}-${pkgver}
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
	/usr/bin/perl Makefile.PL
	make

}

check() {

	cd ${srcdir}/${_dist}-${pkgver}
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB ROOT
	export PERL_MM_USE_DEFAULT=1
	make test

}

package() {

	cd ${srcdir}/${_dist}-${pkgver}
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	make install INSTALLDIRS=vendor DESTDIR="$pkgdir"

}

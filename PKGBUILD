# Maintainer: gls < ghostlovescorebg at gmail dot com >

pkgname='perl-acme-damn'
pkgver='0.06'
pkgrel='2'
pkgdesc="'Unbless' Perl objects"
_dist=Acme-Damn
license=('PerlArtistic' 'GPL')
options=('!emptydirs' purge)
arch=('i686' 'x86_64')
depends=('perl' 'perl-test-exception' 'perl-test-simple')
makedepends=('perl-extutils-makemaker')
url='https://metacpan.org/release/Acme-Damn'
source=("http://search.cpan.org/CPAN/authors/id/I/IB/IBB/${_dist}-${pkgver}.tar.gz")
md5sums=('49967bcae23d97ee8db5eaa1bcca7d2d')

build() {

        cd "${srcdir}/${_dist}-${pkgver}"
        unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB ROOT
        export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
        /usr/bin/perl Makefile.PL
        make

}
check() {

      cd "${srcdir}/${_dist}-${pkgver}"
      unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB ROOT
      export PERL_MM_USE_DEFAULT=1
      make test

}

package() {

      cd "${srcdir}/${_dist}-${pkgver}"
      unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
      make install INSTALLDIRS=vendor DESTDIR="$pkgdir"

}

# vim:set ts=2 sw=2 et:

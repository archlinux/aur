# Maintainer: int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-email-date'
pkgver='1.104'
pkgrel='2'
pkgdesc="Perl/CPAN Module Email::Date: Find and Format Date Headers"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-capture-tiny' 'perl-email-abstract>=2.10' 'perl-email-date-format>=1.000' 'perl-timedate')
makedepends=()
url='https://metacpan.org/release/Email-Date'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Email-Date-1.104.tar.gz')
md5sums=('4df8d2025e24ffc37217b678ec7e4cb3')
sha512sums=('c0efea8cf1742045f4c6709b33a0f4d69f7a6704b6bb2b5dc620195a3e4d0a656957cb6a2c6e1b1801e223c24426c403f34b71d92ce1b8ca7913d62c23607087')
_distdir="Email-Date-1.104"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:

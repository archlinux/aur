# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-web-hippie'
pkgver='0.40'
pkgrel='1'
pkgdesc="Web toolkit for the long hair, or comet"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-anyevent' 'perl-anymq' 'perl-class-accessor' 'perl-http-date' 'perl-json' 'perl-plack' 'perl-protocol-websocket' 'perl')
makedepends=()
url='http://search.cpan.org/dist/Web-Hippie'
source=('http://search.cpan.org/CPAN/authors/id/C/CL/CLKAO/Web-Hippie-0.40.tar.gz')
md5sums=('8b6ad727288f5cd565c355a7538a2369')
sha512sums=('eb4a62db4f4a2a5f87bdf1c7be030925563a60231ed7000565005638de4095516430d4287cb0dc51e3075ca5640cfbc76af5a457bf0b771e607beae165e76eee')
_distdir="Web-Hippie-0.40"

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

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:

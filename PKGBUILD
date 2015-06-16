# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-twiggy'
pkgver='0.1023'
pkgrel='1'
pkgdesc="AnyEvent HTTP server for PSGI (like Thin)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-anyevent' 'perl-http-message' 'perl-plack>=0.99' 'perl-try-tiny')
makedepends=('perl-test-requires' 'perl-test-tcp')
url='http://search.cpan.org/dist/Twiggy'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/Twiggy-0.1023.tar.gz')
md5sums=('683b399ce829eb66cea9e0b072af233d')
sha512sums=('cea59446cc95184db37eff3706010765488bfb5e42ed7dc3e379de5f4e99645dd80507f1c0ad686511a152bb4269f4e92204598506eb1b5e46dabaac5b896e60')
_distdir="Twiggy-0.1023"

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

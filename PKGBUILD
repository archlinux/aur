# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-email-sender'
pkgver='1.300016'
pkgrel='1'
pkgdesc="a library for sending email"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-capture-tiny>=0.08' 'perl-email-abstract>=3.006' 'perl-email-address' 'perl-email-simple>=1.998' 'perl-list-moreutils' 'perl-module-runtime' 'perl-moo>=1.000008' 'perl-moox-types-mooselike>=0.15' 'perl-sub-exporter' 'perl-throwable' 'perl-try-tiny' 'perl-mro-compat' 'perl-module-pluggable')
makedepends=()
url='http://search.mcpan.org/dist/Email-Sender'
source=('http://search.mcpan.org/CPAN/authors/id/R/RJ/RJBS/Email-Sender-1.300016.tar.gz')
md5sums=('758b2dcb2ca1dfb6f9c94ddf94aa0a57')
sha512sums=('b64ae8308f066b864bc414d9574a0ab9e04f08aeb31e25b296d740f094c6c4abcd208dbc0b668a9b1fe9dcbbb22e8cfb398101f20d05d1403db320348fdc01eb')
_distdir="Email-Sender-1.300016"

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

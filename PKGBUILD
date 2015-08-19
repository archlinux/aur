# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-email-sender'
pkgver='1.300018'
pkgrel='1'
pkgdesc="a library for sending email"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-capture-tiny>=0.08' 'perl-email-abstract>=3.006' 'perl-email-address' 'perl-email-simple>=1.998' 'perl-list-moreutils' 'perl-module-runtime' 'perl-moo>=1.000008' 'perl-moox-types-mooselike>=0.15' 'perl-sub-exporter' 'perl-throwable' 'perl-try-tiny')
makedepends=()
url='https://metacpan.org/release/Email-Sender'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Email-Sender-1.300018.tar.gz')
md5sums=('03a3d018c52ce2a10ed541753196b0e8')
sha512sums=('1ac1db7bb7c38eb0c8dc5f5fee540bb5d82d308292a7a3c928262ee5b528f6a3c4e8613d3bceb2c48abbc2f5d0bf5e56e7f91348a0d0984d13223a9d9706ddec')
_distdir="Email-Sender-1.300018"

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

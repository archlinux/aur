# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-email-valid'
pkgver='1.194'
pkgrel='1'
pkgdesc="Check validity of Internet email addresses"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-mailtools' 'perl-net-dns' 'perl>=5.006')
makedepends=()
url='http://search.mcpan.org/dist/Email-Valid'
source=('http://search.mcpan.org/CPAN/authors/id/R/RJ/RJBS/Email-Valid-1.194.tar.gz')
md5sums=('65633b4a64139aa326321e5b3f1151ce')
sha512sums=('55f907b2091adb1d2a205af220529b773e73377043da588edd5c032e5c148a5c6a36eafcb7ac71c2ec73ee74bb04ccb844f3977bbe6dcf23ce13bce6a6976e6b')
_distdir="Email-Valid-1.194"

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

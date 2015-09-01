# Contributor: Christos Nouskas <nous@archlinux.us>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-module-spy'
pkgver='0.05'
pkgrel='1'
pkgdesc="Spy for Perl5"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.5')
makedepends=()
url='https://metacpan.org/release/Module-Spy'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TOKUHIROM/Module-Spy-0.05.tar.gz')
md5sums=('06a1c12a620bf486c60ec2f6bde2bfc1')
sha512sums=('7d6a773832a9e29ea75add27930b12109b2c1c73e280c7fae8b12b0c0068efee5d1979d779b415d68e28b8b4110cad8a57eb1bffa888733695e83fe20f7d2888')
_distdir="Module-Spy-0.05"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:

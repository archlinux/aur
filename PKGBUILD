# Contributor: BluePeril <blueperil@blueperil.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-uri-cpan'
pkgver='1.007'
pkgrel='1'
pkgdesc="URLs that refer to things on the CPAN"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1' 'perl-cpan-distnameinfo')
makedepends=()
checkdepends=('perl-uri')
url='https://metacpan.org/release/URI::cpan'
source=("https://cpan.metacpan.org/authors/id/R/RJ/RJBS/URI-cpan-${pkgver}.tar.gz")
md5sums=('60aa35b085d2baa5bcd7d6062029fcee')
sha512sums=('1c7a900a0f319dc7e2c4d1a3adeb3e55459df4563251f54f8ea6cd6f00911189a2f724fd9b90b5dbdf9933d393ce148568653d5bae4362d67b643024dc371342')
_distdir="URI-cpan-${pkgver}"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:

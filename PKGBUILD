# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-text-microtemplate'
pkgver='0.20'
pkgrel='1'
pkgdesc="Micro template engine with Perl5 language"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.0')
makedepends=()
url='http://search.cpan.org/dist/Text-MicroTemplate'
source=('http://search.cpan.org/CPAN/authors/id/K/KA/KAZUHO/Text-MicroTemplate-0.20.tar.gz')
md5sums=('03627343e85e269ddc6e7dfc5efe8c65')
sha512sums=('107379e2ea5c1c1f6df5578dcade9b0a698b983f6801a21890de75a046bb77cfa0ed48b3531973adc73fb8f421bd5ab0ce8c01817227f102730ffb8bfa082cff')
_distdir="Text-MicroTemplate-0.20"

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

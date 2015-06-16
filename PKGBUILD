# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-lingua-stem-it'
pkgver='0.02'
pkgrel='1'
pkgdesc="Porter's stemming algorithm for Italian"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Lingua-Stem-It'
source=('http://search.cpan.org/CPAN/authors/id/A/AC/ACALPINI/Lingua-Stem-It-0.02.tar.gz')
md5sums=('611ec6d600f1280aa6c510c83b7bc4a2')
sha512sums=('3cd4f74518b22fa30aee001c186f76fea406d37a426dcafc9f38a0513679f407b743b2de01f4a82cbba267ac26cd1b656e30738134535a31d22af4afe44b515f')
_distdir="Lingua-Stem-It-0.02"

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

# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-apache-asp'
pkgver='2.62'
pkgrel='1'
pkgdesc="Active Server Pages for Apache with mod_perl "
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-mldbm' 'perl-mldbm-sync')
makedepends=()
url='http://search.cpan.org/dist/Apache-ASP'
source=('http://search.cpan.org/CPAN/authors/id/C/CH/CHAMAS/Apache-ASP-2.62.tar.gz')
md5sums=('60639bbb979fab917225a9078414f317')
sha512sums=('4e31c76cee66fa024c59a6e1c3b698ec8ef734fc8cdb2bc7631ab0fb3527163a35ba5e73648bc2c7fd5079d1b1797bc8d58da4811ae2b1fdf80998a0b419ddb3')
_distdir="Apache-ASP-2.62"

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

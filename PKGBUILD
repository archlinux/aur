# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-io-prompt'
pkgver='0.997002'
pkgrel='1'
pkgdesc="Interactively prompt for user input"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-term-readkey' 'perl-want')
makedepends=()
url='http://search.cpan.org/dist/IO-Prompt'
source=('http://search.cpan.org/CPAN/authors/id/D/DC/DCONWAY/IO-Prompt-0.997002.tar.gz')
md5sums=('292048668ee6c489c61da6665bdc1c1f')
sha512sums=('468afe08cb5d960070b0895108932f47cc8e151b868ac57d6ae9237c520878d72765fe7f6c34dcf1e72f2453fe608d9fb38cbd13b283e415a038356cf006d27b')
_distdir="IO-Prompt-0.997002"

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

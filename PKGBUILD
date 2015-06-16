# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-catalyst-model-file'
pkgver='0.10'
pkgrel='1'
pkgdesc="File based storage model for Catalyst."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1' 'perl-catalyst-component-instancepercontext' 'perl-catalyst-runtime' 'perl-moose' 'perl-moosex-types' 'perl-moosex-types-path-class' 'perl-mro-compat' 'perl-namespace-autoclean' 'perl-path-class')
makedepends=()
url='http://search.cpan.org/dist/Catalyst-Model-File'
source=('http://search.cpan.org/CPAN/authors/id/A/AS/ASH/Catalyst-Model-File-0.10.tar.gz')
md5sums=('a01192bb2a6103ba4b0520289d03da63')
sha512sums=('a8a6f3bbc5b42410be68c6352a94cc3e3f788910a2938304464ca17aff5213a445630b60176e3630255a4784e0dd050aa2f837714a831503006ba2c9800c261d')
_distdir="Catalyst-Model-File-0.10"

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

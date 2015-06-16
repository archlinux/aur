# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-mousex-nativetraits'
pkgver='1.09'
pkgrel='1'
pkgdesc="Extend your attribute interfaces for Mouse"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.6.2' 'perl-mouse>=0.82')
makedepends=('perl-any-moose>=0.13' 'perl-test-fatal>=0.003')
url='http://search.cpan.org/dist/MouseX-NativeTraits'
source=('http://search.cpan.org/CPAN/authors/id/G/GF/GFUJI/MouseX-NativeTraits-1.09.tar.gz')
md5sums=('de2ab3b97e701b69b7fa98fafd675eec')
sha512sums=('2aad717c7c78c1014f705a85b8bb8cab79febb827aa478a0884bcdd4d8d702a366785bc6104ba115513c234b8ca71cafcbbbc070ba37d6328255fe1f972c3619')
_distdir="MouseX-NativeTraits-1.09"

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

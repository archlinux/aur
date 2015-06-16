# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-catalyst-plugin-fillinform'
pkgver='0.12'
pkgrel='1'
pkgdesc="FillInForm for Catalyst"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-action-renderview' 'perl-catalyst-runtime' 'perl-html-fillinform' 'perl-mro-compat')
makedepends=()
url='http://search.cpan.org/dist/Catalyst-Plugin-FillInForm'
source=('http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/Catalyst-Plugin-FillInForm-0.12.tar.gz')
md5sums=('a8d7dba75cd7622d5fe625e37d51c5cb')
sha512sums=('572c601a47218c23982f435115b89c48308af7cd22558165ca105a42ab3e247593f261785f4cce6d367f96f792de927219f3494b9e9d749a95dde93228fe2f2b')
_distdir="Catalyst-Plugin-FillInForm-0.12"

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

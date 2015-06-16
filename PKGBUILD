# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-module-install-authorrequires'
pkgver='0.02'
pkgrel='1'
pkgdesc="declare author-only dependencies"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-module-install')
makedepends=()
url='http://search.cpan.org/dist/Module-Install-AuthorRequires'
source=('http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/Module-Install-AuthorRequires-0.02.tar.gz')
md5sums=('efb5bffec707ee721cc8c34a6d8bcf31')
sha512sums=('66d2a603e5700eca0a93523b6adcd0330d439b41730b7ccb2606fc4e43e4b6620cf376637fcbbe71d4733ce144c46822fecac39d4bed3d5303b68863425d9819')
_distdir="Module-Install-AuthorRequires-0.02"

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

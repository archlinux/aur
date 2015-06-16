# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-module-install-repository'
pkgver='0.06'
pkgrel='1'
pkgdesc="Automatically sets repository URL from svn/svk/Git checkout"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-path-class')
url='http://search.cpan.org/dist/Module-Install-Repository'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/Module-Install-Repository-0.06.tar.gz')
md5sums=('cea8fc958cebe19e1be64d7cadbbc470')
sha512sums=('793db0c81ddded246dc2feb9358ed2367492de077639f947b56290d381ec6310cfa5dc123bd7cd5cbdb2b770850a47c57206110c4dabb53cb577df33a445d54c')
_distdir="Module-Install-Repository-0.06"

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

# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-html-formattext-withlinks-andtables'
pkgver='0.02'
pkgrel='1'
pkgdesc="Converts HTML to Text with tables in tact"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-formattext-withlinks>=0' 'perl-html-tree>=0')
makedepends=()
url='http://search.cpan.org/dist/HTML-FormatText-WithLinks-AndTables'
source=('http://search.cpan.org/CPAN/authors/id/S/SF/SFRYER/HTML-FormatText-WithLinks-AndTables-0.02.tar.gz')
md5sums=('804146aa9e49a5b1af4f63fecd9b0c28')
sha512sums=('905bb42cbdf9591418dcf738ee1aaa6b6e1d56c47aaf8c4194bb17b43745cc6d82a4eb65d74ad8c95531940ad67c539329b327d5385f88e80f0a879a6e10bba2')
_distdir="HTML-FormatText-WithLinks-AndTables"

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

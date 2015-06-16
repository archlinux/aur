# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-catalyst-plugin-autocrud'
pkgver='2.143070'
pkgrel='1'
pkgdesc="Instant AJAX web front-end for DBIx::Class"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-action-renderview' 'perl-catalyst-model-dbic-schema' 'perl-catalyst-plugin-configloader' 'perl-catalyst-runtime' 'perl-catalyst-view-json' 'perl-catalyst-view-tt' 'perl-class-data-inheritable' 'perl-dbd-sqlite' 'perl-dbi' 'perl-dbix-class>=0.08127' 'perl-dbix-class-schema-loader' 'perl-data-page' 'perl-file-slurp' 'perl-json>=2.90' 'perl-json-xs' 'perl-lingua-en-inflect-number' 'perl-list-moreutils' 'perl-mro-compat' 'perl-module-pluggable' 'perl-sql-translator')
makedepends=()
checkdepends=('perl-test-www-mechanize-catalyst')
url='http://search.mcpan.org/dist/Catalyst-Plugin-AutoCRUD'
source=('http://search.mcpan.org/CPAN/authors/id/O/OL/OLIVER/Catalyst-Plugin-AutoCRUD-2.143070.tar.gz')
md5sums=('a0636a08518be90b4c6d3d343941e3e4')
sha512sums=('1811161fe6c611182eea70289291129fd1ab09119e1b451a4c610654ceec12098d89354e300950890c6c33d5a0f14748e9c851376b570270a73857fa15fddb21')
_distdir="Catalyst-Plugin-AutoCRUD-2.143070"

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

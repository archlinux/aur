# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-dbix-class-dynamicdefault'
pkgver='0.04'
pkgrel='1'
pkgdesc="Automatically set and update fields"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dbix-class>=0.08127')
makedepends=('perl-dbicx-testdatabase')
url='http://search.cpan.org/dist/DBIx-Class-DynamicDefault'
source=('http://search.cpan.org/CPAN/authors/id/M/MS/MSTROUT/DBIx-Class-DynamicDefault-0.04.tar.gz')
md5sums=('0f4ae1e7bc8a638f679922b387fbb011')
sha512sums=('fb7b7b23585812b305ecae1341771762df4cd9e244ae002b586df3ebcc29b44a66f593c34da4d3c1212a234ee994f180d14d8d28879ec8246e0d1c0783baf8b8')
_distdir="DBIx-Class-DynamicDefault-0.04"

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

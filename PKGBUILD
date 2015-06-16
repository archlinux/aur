# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-dbix-class-introspectablem2m'
pkgver='0.001001'
pkgrel='1'
pkgdesc="Introspect many-to-many relationships"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dbix-class')
makedepends=()
url='http://search.cpan.org/dist/DBIx-Class-IntrospectableM2M'
source=('http://search.cpan.org/CPAN/authors/id/G/GR/GRODITI/DBIx-Class-IntrospectableM2M-0.001001.tar.gz')
md5sums=('9c05959fdb632062ec827ec0c7335eae')
sha512sums=('14cc300dadcd3687c46fa862196aa6b276493c15783dad5fb2dafcf26d0539c3d9703f6ac2d44494cd3f497d13666ec176bcf590dea38613b597a0367fe59732')
_distdir="DBIx-Class-IntrospectableM2M-0.001001"

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

# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-dbix-class-encodedcolumn'
pkgver='0.00012'
pkgrel='1'
pkgdesc="Automatically encode column values"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dbix-class>=0.06002' 'perl-sub-name>=0.04')
makedepends=('perl-dbd-sqlite' 'perl-dir-self')
url='http://search.cpan.org/dist/DBIx-Class-EncodedColumn'
source=('http://search.cpan.org/CPAN/authors/id/W/WR/WREIS/DBIx-Class-EncodedColumn-0.00012.tar.gz')
md5sums=('6753b16841df185e30a4471d82b030a0')
sha512sums=('797f88f2521119f63c8ebf3d20edab451fa240898df9c5a0f1ae66556da6f60350f9bbe34ef113e06e1c6d30b84daafdaa99e1d55f4a2f6ddfa46ecfcf3fcb92')
_distdir="DBIx-Class-EncodedColumn-0.00012"

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

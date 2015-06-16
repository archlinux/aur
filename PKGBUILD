# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-cpan-checksums'
pkgver='2.08'
pkgrel='1'
pkgdesc="Write a CHECKSUMS file for a directory as on CPAN"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-compress-bzip2' 'perl-data-compare')
makedepends=()
url='http://search.cpan.org/dist/CPAN-Checksums'
source=('http://search.cpan.org/CPAN/authors/id/A/AN/ANDK/CPAN-Checksums-2.08.tar.gz')
md5sums=('058679056ade8ee885b8538fe195d84a')
sha512sums=('4da547d37b2ca919d7459607bb780b93d78429de88fe0749e23a2e8930ae97cbbd0350e0951fa0facf10ec595bac2bc25ef8da487f81f4e736cc3bd2c0e47f4d')
_distdir="CPAN-Checksums-2.08"

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

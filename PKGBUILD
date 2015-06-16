# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-sql-abstract-limit'
pkgver='0.141'
pkgrel='1'
pkgdesc="portable LIMIT emulation"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dbi' 'perl-sql-abstract>=1.2')
makedepends=('perl-test-deep' 'perl-test-exception')
url='http://search.cpan.org/dist/SQL-Abstract-Limit'
source=('http://search.cpan.org/CPAN/authors/id/D/DA/DAVEBAIRD/SQL-Abstract-Limit-0.141.tar.gz')
md5sums=('d8dde39b1d7910ddf5457108c02be552')
sha512sums=('f7c09b14fe9cb94675bdfbc428d38f9653352f6dae090dc5ce905e5886205192bbe1da8ebff53780c0cac39d078930ef2644ea238d8e8be5b0a577b7b75df7a9')
_distdir="SQL-Abstract-Limit-0.141"

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

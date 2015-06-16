# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-class-mix'
pkgver='0.005'
pkgrel='1'
pkgdesc="dynamic class mixing"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006' 'perl-params-classify')
makedepends=()
url='http://search.cpan.org/dist/Class-Mix'
source=('http://search.cpan.org/CPAN/authors/id/Z/ZE/ZEFRAM/Class-Mix-0.005.tar.gz')
md5sums=('7d6c4e70dea13678d845898a4a1565c0')
sha512sums=('9486a8ec4f6b1a5483610cdac110eed219bb849e8895a350309167206f8caef4209abbbc340a467f4c3b2ca3afc6e2b49b66601110517b66684689f4d88d20c9')
_distdir="Class-Mix-0.005"

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

# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-term-readline-zoid'
pkgver='0.07'
pkgrel='1'
pkgdesc="another ReadLine package"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-term-readkey')
makedepends=()
url='http://search.cpan.org/dist/Term-ReadLine-Zoid'
source=('http://search.cpan.org/CPAN/authors/id/P/PA/PARDUS/Term-ReadLine-Zoid/Term-ReadLine-Zoid-0.07.tar.gz')
md5sums=('83438aa11e983f3bd5238b9f8535d7bf')
sha512sums=('b13da20516411ffe3996e6809d5f144a8b2ad0504d2ec2d725facd8aeab90b5fcf6ab4c31695454dc2eecaf802d5152e4cb4c9fe57a56a29e0faaedfd1d6d4be')
_distdir="Term-ReadLine-Zoid-0.07"

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

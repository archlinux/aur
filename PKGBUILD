# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-snowball-swedish'
pkgver='1.2'
pkgrel='1'
pkgdesc="Porters stemming algorithm for swedish."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Snowball-Swedish'
source=('http://search.cpan.org/CPAN/authors/id/A/AS/ASKSH/Snowball-Swedish-1.2.tar.gz')
md5sums=('e2ed0f5c2a9fc7e500c61553c4c1e9c9')
sha512sums=('799f22c298100fad901cf69b3bcc0b3be109b1557feb5554a1aa2898542b27bff3c7bcea8fa402d850e211751a6a23453521a395460df551d46cbda3a4ab4296')
_distdir="Snowball-Swedish-1.2"

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

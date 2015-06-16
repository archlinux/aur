# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-php-serialization'
pkgver='0.34'
pkgrel='1'
pkgdesc="simple flexible means of converting the output of PHP's serialize() into the equivalent Perl memory structure, and vice versa."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/PHP-Serialization'
source=('http://search.cpan.org/CPAN/authors/id/B/BO/BOBTFISH/PHP-Serialization-0.34.tar.gz')
md5sums=('333af0848ad79931875a35cc61dc22e0')
sha512sums=('72218973f21ab71419751cf818e6bd998235aa74bf8ae60ec4a6080ba169d0d7fcefde4f433ce3f6f30ed3084a651deb8aa3a5dd818fc6ebf3fb6188def4efe7')
_distdir="PHP-Serialization-0.34"

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

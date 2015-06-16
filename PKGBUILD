# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-image-grab'
pkgver='1.4.2'
pkgrel='1'
pkgdesc="Perl extension for Grabbing images off the Internet."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-parser' 'perl-html-tree' 'perl-http-cookies' 'perl-libwww' 'perl-uri')
makedepends=()
url='http://search.cpan.org/dist/Image-Grab'
source=('http://search.cpan.org/CPAN/authors/id/M/MA/MAHEX/Image-Grab-1.4.2.tar.gz')
md5sums=('8a62dcff23997e525f7557451f5758dd')
sha512sums=('fce76dd733f25058222ab31ed14ac0d00e2e34a98822647c1089fa3945369ac84ab3f214e18f739f428510cbf961150f17fe6c911185c5eccc1e0da3b821a9de')
_distdir="Image-Grab-1.4.2"

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

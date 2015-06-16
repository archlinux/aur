# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-heap-simple-perl'
pkgver='0.14'
pkgrel='1'
pkgdesc="A pure perl implementation of the Heap::Simple interface"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-heap-simple>=0.09')
makedepends=()
url='http://search.cpan.org/dist/Heap-Simple-Perl'
source=('http://search.cpan.org/CPAN/authors/id/T/TH/THOSPEL/Heap-Simple-Perl-0.14.tar.gz')
md5sums=('a2723ab28b7fcb35131037525a5b2f93')
sha512sums=('806f941d00cde98f1c0352965cce36350527b1f9c40eff97e41b4716cc727f0fffb9f1dbbb95f961d00b6ed95d2fd3ab9cf4af299fcc61be9b338f9b247d2489')
_distdir="Heap-Simple-Perl-0.14"

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

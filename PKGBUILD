# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-cpanplus-dist-suse'
pkgver='0.03'
pkgrel='1'
pkgdesc="To build RPM files from cpan for SUSE"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-path-class' 'perl-super')
makedepends=()
url='http://search.cpan.org/dist/CPANPLUS-Dist-SUSE'
source=('http://search.cpan.org/CPAN/authors/id/M/MF/MFW/CPANPLUS-Dist-SUSE-0.03.tar.gz')
md5sums=('6908260d4dd171c233653b9986277799')
sha512sums=('90b398f0193a518160e3287c19fcdc2dc5391b6bcf417bb3ac61124f850971bbb863a34851b35ebeed638b1997c063870a47e1c93876e740de937f5e67833a19')
_distdir="CPANPLUS-Dist-SUSE-0.03"

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

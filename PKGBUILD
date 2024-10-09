# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-meta-builder'
pkgver='0.004'
pkgrel='1'
pkgdesc="Tools for creating Meta objects to track custom metrics."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-fennec-lite>=0' 'perl>=5.006')
makedepends=()
checkdepends=('perl-test-exception>=0')
url='https://metacpan.org/release/Meta-Builder'
source=('http://search.cpan.org/CPAN/authors/id/E/EX/EXODIST/Meta-Builder-0.004.tar.gz')
md5sums=('ffd88fc1ab4f5d6b6d875c6179baab82')
sha512sums=('c8dcc7129b08f9e562bcb2077c41c7eb72e108f7a8fd0f41c0b84c5615af02b4f418003d0a86c8ecc6f6c6f693b5928626f6e22c40d303318675c41eb301d2bb')
_distdir="Meta-Builder-0.004"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:

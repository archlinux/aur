# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dist-zilla-plugin-readmefrompod'
pkgver='0.38'
pkgrel='1'
pkgdesc="dzil plugin to generate README from POD"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dist-zilla>=6.000' 'perl-io-string>=0' 'perl-moose>=0' 'perl-path-tiny>=0.004' 'perl-pod-readme>=1.2.0')
makedepends=()
checkdepends=('perl>=5.006')
url='https://metacpan.org/release/Dist-Zilla-Plugin-ReadmeFromPod'
source=('http://search.cpan.org/CPAN/authors/id/F/FA/FAYLAND/Dist-Zilla-Plugin-ReadmeFromPod-0.38.tar.gz')
md5sums=('52bba856a70f3adef86ab656017db3e8')
sha512sums=('28733165ae4061e6df25d2d1f9ca3dd35eac156ae5d7709676a64ae7f087fac19bad2327ce462217192e821a5639388693488ec13fef988ead964144138785b1')
_distdir="Dist-Zilla-Plugin-ReadmeFromPod-0.38"

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

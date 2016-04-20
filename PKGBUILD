# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-chi'
pkgver='0.60'
pkgrel='1'
pkgdesc="Unified cache handling interface"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-carp-assert>=0.20' 'perl-class-load' 'perl-data-uuid' 'perl-digest-jhash' 'perl-hash-moreutils' 'perl-json-maybexs>=1.003003' 'perl-list-moreutils>=0.13' 'perl-log-any>=0.08' 'perl-moo>=1.003' 'perl-moox-types-mooselike>=0.23' 'perl-moox-types-mooselike-numeric' 'perl-string-rewriteprefix' 'perl-task-weaken' 'perl-time-duration>=1.06' 'perl-time-duration-parse>=0.03' 'perl-timedate' 'perl-try-tiny>=0.05')
makedepends=()
checkdepends=('perl-test-class' 'perl-test-deep' 'perl-test-exception' 'perl-test-warn')
url='https://metacpan.org/release/CHI'
source=('http://search.cpan.org/CPAN/authors/id/J/JS/JSWARTZ/CHI-0.60.tar.gz')
md5sums=('e559c52c12de4a27b0210caa1c790e65')
sha512sums=('06d3f22465f38868795a4ee97e1b3e40e66d423c4e28c066c2f11721b770e77c6134ad122ec9a7ea6a7e215d0b712e57c54d91bae02770fbc61e3c10a465b29d')
_distdir="CHI-0.60"

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

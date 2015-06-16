# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-chi'
pkgver='0.58'
pkgrel='1'
pkgdesc="Unified cache handling interface"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-carp-assert>=0.20' 'perl-data-uuid' 'perl-digest-jhash' 'perl-hash-moreutils' 'perl-json' 'perl-list-moreutils>=0.13' 'perl-log-any>=0.08' 'perl-moo>=1.003' 'perl-moox-types-mooselike>=0.23' 'perl-moox-types-mooselike-numeric' 'perl-string-rewriteprefix' 'perl-task-weaken' 'perl-time-duration>=1.06' 'perl-time-duration-parse>=0.03' 'perl-timedate' 'perl-try-tiny>=0.05')
makedepends=('perl-test-class' 'perl-test-deep' 'perl-test-exception' 'perl-test-warn')
url='http://search.cpan.org/dist/CHI'
source=('http://search.cpan.org/CPAN/authors/id/H/HA/HAARG/CHI-0.58.tar.gz')
md5sums=('2efc812710358a6f70fdba7407227d87')
sha512sums=('bcbb485c5160974efdf313a7f4b90062cfb343e3b91b6060d0888a1eae82f019cfaa8710220cf87fa1aa2d0bfed5d560c7192c3491cf0f2e145aee58f28ce60c')
_distdir="CHI-0.58"

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

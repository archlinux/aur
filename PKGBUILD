# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dist-zilla-plugin-test-perl-critic'
pkgver='3.004'
pkgrel='1'
pkgdesc="Tests to check your code against best practices"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-data-section>=0.004' 'perl-dist-zilla>=0' 'perl-moose>=0' 'perl-sub-exporter-formethods>=0' 'perl-namespace-autoclean>=0' 'perl>=5.008')
makedepends=()
url='https://metacpan.org/release/Dist-Zilla-Plugin-Test-Perl-Critic'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Dist-Zilla-Plugin-Test-Perl-Critic-3.004.tar.gz')
md5sums=('840e4c90ef2039b7a804191612222524')
sha512sums=('c71e8cd7dc552a3b5564657319d3b5e4bee2f53238d7ef8ab06b495b65f82ba120042061681386c46dbb373f0106e5aa578afa0fdf0bf9245b9da3ca75f7dd57')
_distdir="Dist-Zilla-Plugin-Test-Perl-Critic-3.004"

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

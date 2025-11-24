# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dist-zilla-plugin-test-perl-critic'
pkgver='3.005'
pkgrel='1'
pkgdesc="Tests to check your code against best practices"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-data-section>=0.004' 'perl-dist-zilla>=0' 'perl-moose>=0' 'perl-path-tiny>=0' 'perl-sub-exporter-formethods>=0' 'perl-namespace-autoclean>=0' 'perl>=5.008')
makedepends=()
url='https://metacpan.org/release/Dist-Zilla-Plugin-Test-Perl-Critic'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Dist-Zilla-Plugin-Test-Perl-Critic-3.005.tar.gz')
md5sums=('221dd284440375d648620a601c37af3c')
sha512sums=('2cb43dbc06b20e5b307795ddd2c532f598105a9f04b336aefcf12a38480b16a27530d5dd205ceb866147a87e57009658a12338b70643c81518a4ad0df166735c')
_distdir="Dist-Zilla-Plugin-Test-Perl-Critic-3.005"

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

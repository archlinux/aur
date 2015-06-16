# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-test-yaml-valid'
pkgver='0.04'
pkgrel='1'
pkgdesc="Test for valid YAML"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-yaml>=0.60' 'perl-yaml-libyaml' 'perl-yaml-syck>=0.60' 'perl-yaml-tiny')
makedepends=()
url='http://search.cpan.org/dist/Test-YAML-Valid'
source=('http://search.cpan.org/CPAN/authors/id/J/JR/JROCKWAY/Test-YAML-Valid-0.04.tar.gz')
md5sums=('553374b7e9f906e005b979e1d6853708')
sha512sums=('5e1ab689759fed4e907b23bb004989812b9f4602de187af8bb9d911aa2f0c2195c036a36348bba42e91a7d61e8c5000e5d396874aa32e9f9115ace24c9af8816')
_distdir="Test-YAML-Valid-0.04"

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

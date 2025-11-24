# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dist-zilla-plugin-github'
pkgver='0.49'
pkgrel='1'
pkgdesc="Plugins to integrate Dist::Zilla with GitHub"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-load>=0' 'perl-dist-zilla>=0' 'perl-git-wrapper>=0' 'perl-io-socket-ssl>=1.56' 'perl-json-maybexs>=0' 'perl-moose>=0' 'perl-net-ssleay>=1.49' 'perl-path-tiny>=0' 'perl-try-tiny>=0' 'perl>=5.010')
makedepends=()
checkdepends=('perl-test-deep>=0' 'perl-test-deep-json>=0' 'perl-test-fatal>=0')
url='https://metacpan.org/release/Dist-Zilla-Plugin-GitHub'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Dist-Zilla-Plugin-GitHub-0.49.tar.gz')
md5sums=('c246fd06fa73a2b04d1049f3ffac91ea')
sha512sums=('ce1cd91b620038826958ef8c3bd4f879d262e102f1c904a2cc1905236b120c6865195ca22bbde05f23dec3525f4f2bcf056b7fa05ec7bb1c0a722728e7462b9d')
_distdir="Dist-Zilla-Plugin-GitHub-0.49"

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

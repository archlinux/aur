# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-dist-zilla-plugin-installguide'
pkgver='1.200006'
pkgrel='1'
pkgdesc="Build an INSTALL file"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dist-zilla' 'perl-moose' 'perl-path-tiny' 'perl')
makedepends=()
checkdepends=('perl-test-fatal')
url='https://metacpan.org/release/Dist-Zilla-Plugin-InstallGuide'
source=('http://search.cpan.org/CPAN/authors/id/D/DO/DOHERTY/Dist-Zilla-Plugin-InstallGuide-1.200006.tar.gz')
md5sums=('801443d28f1795868d1b541bfc28f622')
sha512sums=('cae2e5d62b525f3a68b6dbe7addcef14f8779229dd53774e9b691826fff5983f267bda349820292a97959c29a19666e46286992eea87396807c3cce235c6e39d')
_distdir="Dist-Zilla-Plugin-InstallGuide-1.200006"

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

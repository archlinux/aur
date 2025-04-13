# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-module-info'
pkgver='0.39'
pkgrel='1'
pkgdesc="Information about Perl modules"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-b-utils>=0.27' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Module-Info'
source=('http://search.cpan.org/CPAN/authors/id/N/NE/NEILB/Module-Info-0.39.tar.gz')
md5sums=('0901a22c409d7104e39954b533215399')
sha512sums=('f433c97935d4f099b83eb191b902b34831003db2bacf07ebe4700edbbff4d8b42dce50065d7769ab01384b60728010a0c14676fceda1648c5394cd77b1228ab9')
_distdir="Module-Info-0.39"

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

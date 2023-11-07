# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-net-netmask'
pkgver='2.0002'
pkgrel='1'
pkgdesc="parse, manipulate and lookup IP network blocks"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.6.1')
makedepends=()
checkdepends=('perl-test-useallmodules>=0.17' 'perl-test2-suite>=0')
url='https://metacpan.org/release/Net-Netmask'
source=('http://search.cpan.org/CPAN/authors/id/J/JM/JMASLAK/Net-Netmask-2.0002.tar.gz')
md5sums=('a05fe8ca952c1db0acff02cbc6626148')
sha512sums=('60cd9de1cac95516515428eb7d1c883b5260333768c363b47a87bb404b13bac713746e7512ff1f52bf3e5c8344f0d38889bba44a2c84b8ddf36e969d63ea8373')
_distdir="Net-Netmask-2.0002"

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

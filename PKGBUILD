# Contributor: Ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-critic-pulp'
pkgver='100'
pkgrel='1'
pkgdesc="some add-on perlcritic policies"
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-io-string>=1.02' 'perl-list-moreutils>=0.24' 'perl-ppi>=1.220' 'perl-perl-critic>=1.084' 'perl-pod-minimumversion>=50' 'perl-pod-parser>=0' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Perl-Critic-Pulp'
source=("http://search.cpan.org/CPAN/authors/id/K/KR/KRYDE/Perl-Critic-Pulp-$pkgver.tar.gz")
md5sums=('17edf2a21d2ff4f368aa3390669895a5')
sha512sums=('2d683d70737649137d143ab52c7a0f122ec4f1719da5dc9e1a34362d8f34cb8d8f7ed51ad954e883a5c5c796b9c4ededdd4934594eb283c6c194f2c1a285670a')
_distdir="Perl-Critic-Pulp-$pkgver"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:

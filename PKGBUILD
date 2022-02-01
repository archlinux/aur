# Contributor: Ordoban <dirk.langer@vvovgonik.de> 
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-critic-pulp'
pkgver='99'
pkgrel='1'
pkgdesc="some add-on perlcritic policies"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-io-string>=1.02' 'perl-list-moreutils>=0.24' 'perl-ppi>=1.220' 'perl-perl-critic>=1.084' 'perl-pod-minimumversion>=50' 'perl-pod-parser>=0' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Perl-Critic-Pulp'
source=('http://search.cpan.org/CPAN/authors/id/K/KR/KRYDE/Perl-Critic-Pulp-99.tar.gz')
md5sums=('d4eb22b458bdca8d175d6d2c2feb89a4')
sha512sums=('11c48f61133e20c74d00002df181efb9ad825afa6441d78fd841a253e98d39c5d230196031d674c11547fb9fa3f0dc78b20f2118f128c09bfc5a217da79460b7')
_distdir="Perl-Critic-Pulp-99"

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

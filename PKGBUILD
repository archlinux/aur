# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-moosex-types-uri'
pkgver='0.09'
pkgrel='1'
pkgdesc="URI related types and coercions for Moose"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose>=0' 'perl-moosex-types>=0.40' 'perl-moosex-types-path-class>=0' 'perl-uri>=0' 'perl-uri-fromhash>=0' 'perl-namespace-autoclean>=0' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/MooseX-Types-URI'
source=("https://cpan.metacpan.org/authors/id/E/ET/ETHER/MooseX-Types-URI-$pkgver.tar.gz")
md5sums=('69b5a5271ac6279f609e90b4d31c4bfc')
sha512sums=('b55fcb34a7033fe3e9d24b66aea4caf9bbc5508f609cd299fc2a31e1869e8b5b0b2007721a2c62f842890bfabbeb3787137c3c9684268228e6061e7c758b027c')
_distdir="MooseX-Types-URI-$pkgver"

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

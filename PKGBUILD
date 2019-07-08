# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-moosex-types-uri'
pkgver='0.08'
pkgrel='1'
pkgdesc="URI related types and coercions for Moose"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose>=0' 'perl-moosex-types>=0.40' 'perl-moosex-types-path-class>=0' 'perl-uri>=0' 'perl-uri-fromhash>=0' 'perl-namespace-autoclean>=0' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/MooseX-Types-URI'
source=('https://cpan.metacpan.org/authors/id/E/ET/ETHER/MooseX-Types-URI-0.08.tar.gz')
md5sums=('d1d6a34136b9447cebe30b0b3d465c00')
sha512sums=('0cf93dd965b618963945a1783af70c40389ca58818f0ea6ee7f168b70dadca5d332fd9391522fcaabb8e1d9e4baaa1b59606865db05a21a5ee548ccac1e08ed6')
_distdir="MooseX-Types-URI-0.08"

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

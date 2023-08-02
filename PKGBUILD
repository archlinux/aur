# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

_distname='Data-Printer'

pkgname='perl-data-printer'
pkgver='1.001001'
pkgrel='1'
pkgdesc="colored pretty-print of Perl data structures and objects"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-clone-pp' 'perl-file-homedir>=0.91' 'perl-package-stash>=0.3' 'perl-sort-naturally')
url="https://metacpan.org/release/${_distname}"
source=("http://cpan.metacpan.org/authors/id/G/GA/GARU/${_distname}-${pkgver}.tar.gz")
sha512sums=('3f92443fe2aa32a1f022e6e5fce1c8e2d1abe6e40d322fde9c195df38c40ff5e962370bdda65f5f93e27cdb806efbe93e56b075ee639491b4805ade6bb36f1cc')

_distdir="${_distname}-${pkgver}"

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

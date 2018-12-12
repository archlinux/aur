# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

_distname='Data-Printer'

pkgname='perl-data-printer'
pkgver='0.40'
pkgrel='1'
pkgdesc="colored pretty-print of Perl data structures and objects"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-clone-pp' 'perl-file-homedir>=0.91' 'perl-package-stash>=0.3' 'perl-sort-naturally')
url="https://metacpan.org/release/${_distname}"
source=("http://cpan.metacpan.org/authors/id/G/GA/GARU/${_distname}-${pkgver}.tar.gz")
sha512sums=('9aa92013c4d1f43a654f2e40f797a20f2fc5576d9496bc40bfe4b63e3f2c5893ffb4b83aaeca9c27ca09ab248e18ec44c1a0ca5a34cf140f62522f7adf15f446')

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

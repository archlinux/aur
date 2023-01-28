# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-marc-file-mij'
pkgver='0.04'
pkgrel='1'
pkgdesc="Read newline-delimited marc-in-json files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-json>=0' 'perl-marc-record>=0' 'perl-ex-monkeypatched>=0')
makedepends=()
url='https://metacpan.org/release/MARC-File-MiJ'
source=('http://search.cpan.org/CPAN/authors/id/G/GM/GMCHARLT/MARC-File-MiJ-0.04.tar.gz')
md5sums=('05583863fbee95d659977676bce2f857')
sha512sums=('53f4379c4b0886d7208c3b844e762affa0d18f8f292c12be3f8b24ebb1eb3858afa5434df5dc6552762b025b64791f978273ca05f537b1202d90d279a18e67e1')
_distdir="MARC-File-MiJ-0.04"

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

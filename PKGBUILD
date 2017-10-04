# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-marc-charset'
pkgver='1.35'
pkgrel='1'
pkgdesc="Perl/CPAN Module MARC::Charset: convert MARC-8 encoded strings to UTF-8"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-accessor' 'perl-xml-sax')
makedepends=()
url='https://metacpan.org/release/MARC-Charset'
source=("http://search.cpan.org/CPAN/authors/id/G/GM/GMCHARLT/MARC-Charset-$pkgver.tar.gz")
md5sums=('91bd9e001f6d8b621b173280be444cac')
sha512sums=('a75f5d09a45c3abf78899649fb8f0eb8e9973fbcf4eeacf8aae515f0533c60d78b66dbfaecb18c3228b70d815aa90a1e4c7a55f978c4407fda093b094e833d30')
_distdir="MARC-Charset-$pkgver"

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
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:

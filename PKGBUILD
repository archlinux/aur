# Maintainer: Michael Gerdau <mgd@qata.de>
# Maintainer: omangold
# Maintainer: Daenyth
# Contributor: Georg Grabler (STiAT) <ggrabler@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-ogg-vorbis-header'
pkgver='0.10'
pkgrel='1'
pkgdesc="An object-oriented interface to Ogg Vorbis"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-inline>=0.44' 'perl-inline-c>=0')
makedepends=()
url='https://metacpan.org/release/Ogg-Vorbis-Header'
source=('http://search.cpan.org/CPAN/authors/id/D/DA/DAVECROSS/Ogg-Vorbis-Header-0.10.tar.gz')
md5sums=('15879884e292009f7ed641cb91cbc552')
sha512sums=('898f5646085db09abecaa2d1b7bcd361a83bbedf596037e70ec9d3c05051cf10a6940a181af428a2f89124e4e65253f46a0672e61f445451a718703f3dc27abe')
_distdir="Ogg-Vorbis-Header-0.10"

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

# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-music-chord-note'
pkgver='0.07'
pkgrel='1'
pkgdesc="get Chord Tone List from Chord Name"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.6.2')
makedepends=()
url='http://search.cpan.org/dist/Music-Chord-Note'
source=('http://search.cpan.org/CPAN/authors/id/B/BA/BAYASHI/Music-Chord-Note-0.07.tar.gz')
md5sums=('ffe7cd661462f60f14931b73a8ea6fa0')
sha512sums=('4de90b9fc2eb6c04dc93b852f500f3b1850d92b1aca913fd22b4677b5ab920970d4ba8762479d705bb8fceeaa2cb68a98bc33cf3ebea9cd1437e4c00841f5021')
_distdir="Music-Chord-Note-0.07"

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

# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mp3-tag'
pkgver='1.14'
pkgrel='1'
pkgdesc="Module for reading tags of MP3 audio files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/MP3-Tag'
source=('http://search.cpan.org/CPAN/authors/id/I/IL/ILYAZ/modules/MP3-Tag-1.14.tar.gz')
md5sums=('fb087efa020572d8f46890db489be8bb')
sha512sums=('05e35f024868505cfc8a07146442e248ef1e80c3c156fd1eabeb874d458356f6b391793e343a24e9e490fd537e7f280316f651b6717378c06953480d271ed2e1')
_distdir="MP3-Tag-1.14"

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

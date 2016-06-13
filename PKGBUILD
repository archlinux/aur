# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-expect'
pkgver='1.33'
pkgrel='1'
pkgdesc="automate interactions with command line programs that expose a text terminal interface."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-io-tty' 'perl>=5.6.0')
makedepends=()
url='https://metacpan.org/release/Expect'
source=('http://search.cpan.org/CPAN/authors/id/J/JA/JACOBY/Expect-1.33.tar.gz')
md5sums=('1fbb052de1383966a3be5f420a34e83c')
sha512sums=('6351e681d813a98cf12a882cb135c6dc5f38beb72fb96efe13c690b26704acb9c5654b2f27dd833ad078de83cb4144fef4aea381a768c54f9817247210e6b5bf')
_distdir="expect.pm-Expect-1.33"

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

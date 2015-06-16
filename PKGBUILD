# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-libvorbis-perl'
pkgver='0.05'
pkgrel='4'
pkgdesc="Perl extension for Ogg Vorbis streams"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'libogg>=1.3.1' 'libvorbis>=1.3.4' 'libvorbis>=1.3.4')
makedepends=()
url='http://search.mcpan.org/dist/libvorbis-perl'
source=('http://search.mcpan.org/CPAN/authors/id/F/FO/FOOF/libvorbis-perl-0.05.tar.gz')
md5sums=('4b1d0f936b029f4390c524db0892a65f')
sha512sums=('a7d543fe65b491da1e133adbc6545cccca0da914e186af4eefa58df83fcd2bb0a3ba8e1c722e9cccc929e4fe06529bb6b9b2f9fe097e7b9e0b4289c0d1c006b4')
_distdir="libvorbis-perl-0.05"

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

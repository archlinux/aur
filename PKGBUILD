# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-data-dump-streamer'
pkgver='2.40'
pkgrel='1'
pkgdesc="Accurately serialize a data structure as Perl code."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-b-utils>=0')
makedepends=()
url='https://metacpan.org/release/Data-Dump-Streamer'
source=("https://cpan.metacpan.org/authors/id/Y/YV/YVES/Data-Dump-Streamer-$pkgver.tar.gz")
md5sums=('2578bf0e5c3def403152d223aeebb618')
sha512sums=('db21f42ba477cc644cf1e0c572ad5cace072b35d4760e85edccd4a7ae313d1eee19158dbbdd82f42de47ab26ca5f7528882a2a983df3cc44ea3b57f8bc832f64')
_distdir="Data-Dump-Streamer-$pkgver"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
   /usr/bin/perl Build.PL
   /usr/bin/perl Build
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  /usr/bin/perl Build test
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:

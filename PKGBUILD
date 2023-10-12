# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-data-dump-streamer'
pkgver='2.42'
pkgrel='1'
pkgdesc="Accurately serialize a data structure as Perl code."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-b-utils>=0')
makedepends=('perl-module-build')
url='https://metacpan.org/release/Data-Dump-Streamer'
source=("https://cpan.metacpan.org/authors/id/Y/YV/YVES/Data-Dump-Streamer-$pkgver.tar.gz")
md5sums=('e10e06a372a259e16eec791e82cbee60')
sha512sums=('481cc12f8111d83bc97695226531c7eb4ebdbb16ac540de90d8a0c8b1f30cd3dbc62f5def737b9eb08e6c1294fb290d9f347dd90869a7a7278d71ce436787f7d')
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

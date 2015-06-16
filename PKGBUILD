# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-data-dump-streamer'
pkgver='2.38'
pkgrel='1'
pkgdesc="Accurately serialize a data structure as Perl code."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-b-utils')
makedepends=()
url='http://search.mcpan.org/dist/Data-Dump-Streamer'
source=('http://search.mcpan.org/CPAN/authors/id/Y/YV/YVES/Data-Dump-Streamer-2.38.tar.gz')
md5sums=('ca6fa9ef3a29a9c423f78db3a4ff126a')
sha512sums=('1a1e248e4fc6687ca99b1cb105b4ffc13f8f0a3d39c85c4eb82fc465d18b92815b7a9f10bb6b1e31c6d1553e3bdbb24eaefd850b0bdfafc058859882ddf5a51b')
_distdir="Data-Dump-Streamer-2.38"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:

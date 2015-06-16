# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-mp4-info'
pkgver='1.13'
pkgrel='1'
pkgdesc="Fetch info from MPEG-4 files (.mp4, .m4a, .m4p, .3gp)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-io-string')
makedepends=()
url='http://search.cpan.org/dist/MP4-Info'
source=('http://search.cpan.org/CPAN/authors/id/J/JH/JHAR/MP4-Info-1.13.tar.gz')
md5sums=('39fbc8225b01ecbecf13ff9e4ab9b896')
sha512sums=('fea02073cb7a230bd6790264970efce8662c260ed1ee1ba48437380078255518d144248933a31f0203caf00d364721bb5139dc48d1e174e50d6886315f51f66c')
_distdir="MP4-Info-1.13"

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

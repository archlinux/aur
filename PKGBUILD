# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-rtpg'
pkgver='0.92'
pkgrel='1'
pkgdesc="is a module for accessing to rtorrent's SCGI functions."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-mime-types' 'perl-rpc-xml')
makedepends=()
url='http://search.cpan.org/dist/RTPG'
source=('http://search.cpan.org/CPAN/authors/id/U/UN/UNERA/RTPG-0.92.tar.gz')
md5sums=('ff9393d30fd39ecc33e95bdcec091743')
sha512sums=('62a2b691faaf0cf572611aae71a73cf357531a9e16d16879072c57c527fb9d8e4369b1fde9046eba269d3c9a8d4976847b0d43e5a424df5de34ba9b16f6e28dd')
_distdir="RTPG-0.92"

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

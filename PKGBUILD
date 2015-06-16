# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-net-patricia'
pkgver='1.20'
pkgrel='1'
pkgdesc="Patricia Trie perl module for fast IP address lookups"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('glibc>=2.17' 'perl-net-cidr-lite>=0.20' 'perl-socket6')
makedepends=()
url='http://search.cpan.org/dist/Net-Patricia'
source=('http://search.cpan.org/CPAN/authors/id/G/GR/GRUBER/Net-Patricia-1.20.tar.gz')
md5sums=('d5499f5bc1d6c36538a84153095ea11f')
sha512sums=('27ae23b86ed2b2b0e1439d33a167f6b83d636f33c4e3bed6ac3967eaa10a3350645d3ec509e0949db8b290e608f2bc4207370ab075be30177ac1e2a9367f0448')
_distdir="Net-Patricia-1.20"

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

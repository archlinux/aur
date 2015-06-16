# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-uri-fetch'
pkgver='0.09'
pkgrel='1'
pkgdesc="Smart URI fetching/caching"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1' 'perl-class-errorhandler' 'perl-libwww' 'perl-uri')
makedepends=()
url='http://search.cpan.org/dist/URI-Fetch'
source=('http://search.cpan.org/CPAN/authors/id/B/BT/BTROTT/URI-Fetch-0.09.tar.gz')
md5sums=('cfc746bb7f142f0f5b82ea80a4416f2b')
sha512sums=('1cf2d19ae4c18524856c5ae01588db3d46fa99a11315420047b586013c2e6989a2c45890edcb898eb0600395edebfaaadcdbdd6543d2ddda8576cf78d82e64fd')
_distdir="URI-Fetch-0.09"

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

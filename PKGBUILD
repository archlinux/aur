# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-catalyst-model-netblogger'
pkgver='0.04001'
pkgrel='1'
pkgdesc="Catalyst Model to post and retrieve blog entries using Net::Blogger"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-runtime' 'perl-net-blogger>=1.01')
makedepends=()
url='http://search.cpan.org/dist/Catalyst-Model-NetBlogger'
source=('http://search.cpan.org/CPAN/authors/id/C/CL/CLACO/Catalyst-Model-NetBlogger-0.04001.tar.gz')
md5sums=('3ae6ec34d1f39cb6c4f25b58849a45a9')
sha512sums=('630405d09b785145d1928a5135df26540511bdaa001586ae0e22d5d2aaf312fd31750fcc64cce5a45159d649f0ef004585738d8e542e33657bd79b3c26829e78')
_distdir="Catalyst-Model-NetBlogger-0.04001"

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

# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-rivescript'
pkgver='1.28'
pkgrel='1'
pkgdesc="Rendering Intelligence Very Easily"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-json>=1')
makedepends=()
url='http://search.cpan.org/dist/RiveScript'
source=('http://search.cpan.org/CPAN/authors/id/K/KI/KIRSLE/RiveScript-1.28.tar.gz')
md5sums=('b1803e448b529fccefdeffe4ec3dd559')
sha512sums=('ea287a4308f09b35d6bae9d65d267e979fa56fb2325e92c539f3ba253c5b07541e5d1cc9f3745338b04f80ff54c13bec3788fb604edd212527d52a3cf4124f65')
_distdir="RiveScript-1.28"

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

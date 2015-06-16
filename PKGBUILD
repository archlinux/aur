# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-dist-zilla-plugin-checkchangelog'
pkgver='0.01'
pkgrel='1'
pkgdesc="Dist::Zilla with Changes check"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dist-zilla>=1.007')
makedepends=()
url='http://search.cpan.org/dist/Dist-Zilla-Plugin-CheckChangeLog'
source=('http://search.cpan.org/CPAN/authors/id/F/FA/FAYLAND/Dist-Zilla-Plugin-CheckChangeLog-0.01.tar.gz')
md5sums=('a694b9c3ff185f6a5c06b851af9034cf')
sha512sums=('d974eb4994c9d4795a1256c6ffa3a9c9c7f3e30200bf9dfe9610f4a6b75a6a6642630b56304d9ba4ae2fce92a6a8f5d114d90322e4fdc1d655779d2bcb6c6585')
_distdir="Dist-Zilla-Plugin-CheckChangeLog-0.01"

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

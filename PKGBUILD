# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-poe-component-generic'
pkgver='0.1403'
pkgrel='1'
pkgdesc="A POE component that provides non-blocking access to a blocking object."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-devel-symdump>=2' 'perl-poe>=1.311')
makedepends=()
url='http://search.cpan.org/dist/POE-Component-Generic'
source=('http://search.cpan.org/CPAN/authors/id/G/GW/GWYN/POE-Component-Generic-0.1403.tar.gz')
md5sums=('87d9ddc0f06684a15c4303c8733393d5')
sha512sums=('c2da67f177547f6f52dea266aec5fa962a7ba2c0f946b7615306a43b6136e77733d58404fd682885c5ff0ef6d802c751aebb9eae82d03efb6424ab3b561b7061')
_distdir="POE-Component-Generic-0.1403"

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

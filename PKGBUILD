# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-mp3-find'
pkgver='0.07'
pkgrel='1'
pkgdesc="Search and sort MP3 files based on their ID3 tags"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-mp3-info')
makedepends=()
url='http://search.cpan.org/dist/MP3-Find'
source=('http://search.cpan.org/CPAN/authors/id/P/PE/PEICHMAN/MP3-Find-0.07.tar.gz')
md5sums=('37bdd33c4654a3e19d8cffa22d171b69')
sha512sums=('cc931c99448287aaa028825c6f46d38c8dce9cd5ebdc06992af6a2a0b918a52384da87dd0de56489b40900fab05b470152c528421b6c773072bf1b84ea1d2f94')
_distdir="MP3-Find-0.07"

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

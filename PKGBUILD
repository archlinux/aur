# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-dist-zilla-plugin-checkchangeshascontent'
pkgver='0.006'
pkgrel='1'
pkgdesc="Ensure Changes has content before releasing"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-capture-tiny' 'perl-dist-zilla>=2.100950' 'perl-file-pushd' 'perl-moose>=0.99' 'perl-namespace-autoclean>=0.09' 'perl-path-class' 'perl-try-tiny')
makedepends=()
url='http://search.cpan.org/dist/Dist-Zilla-Plugin-CheckChangesHasContent'
source=('http://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/Dist-Zilla-Plugin-CheckChangesHasContent-0.006.tar.gz')
md5sums=('3b38207e57f91a1b2d51cc890cc2fa6c')
sha512sums=('48be216ca008333fd4ade7f1aae2292c7ee73ec245e661bd6dfb98006b1ba290106bee8f36a2e66b41bc5aff87110d084853f7e9d6e9dfe82c2c5fa7d9aa230a')
_distdir="Dist-Zilla-Plugin-CheckChangesHasContent-0.006"

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

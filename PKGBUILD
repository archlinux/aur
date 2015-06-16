# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-business-edi'
pkgver='0.05'
pkgrel='1'
pkgdesc="Top level class for generating U.N. EDI interchange objects and subobjects."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-exporter-easy>=0.14' 'perl-file-find-rule>=0.32' 'perl-json-xs>=2.01' 'perl-list-moreutils>=0.22' 'perl-universal-require>=0.1')
makedepends=()
url='http://search.cpan.org/dist/Business-EDI'
source=('http://search.cpan.org/CPAN/authors/id/J/JO/JOEATZ/Business-EDI-0.05.tgz')
md5sums=('f1a4f8448cccdef20b67a057025773ad')
sha512sums=('de49e34baa8ba1117f71f875a7581054f67002a47fd40626cacd27bf5e583f9db1493c47feef4a132dcf0be662c2b9564df8a289db784f9311a264844cca67ae')
_distdir="atz-Business-EDI-327e01f"

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

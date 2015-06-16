# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-mail-mbox-messageparser'
pkgver='1.5002'
pkgrel='1'
pkgdesc="A fast and simple mbox folder reader"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-filehandle-unget')
makedepends=('perl-text-diff')
url='http://search.cpan.org/dist/Mail-Mbox-MessageParser'
source=('http://search.cpan.org/CPAN/authors/id/D/DC/DCOPPIT/Mail-Mbox-MessageParser-1.5002.tar.gz')
md5sums=('0df054faf3a43a537636ea7ca997694c')
sha512sums=('d36fec04875dd9c22db4a58e63f4af73325b98a7ff3fbfa0ba56f4d15fd8fb50f7fb00d93c05c15eb1b9bfd299835af07c7492589fa76290f1a127a455711f08')
_distdir="Mail-Mbox-MessageParser-1.5002"

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

# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-text-wikicreole'
pkgver='0.07'
pkgrel='1'
pkgdesc="Convert Wiki Creole 1.0 markup to XHTML"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.mcpan.org/dist/Text-WikiCreole'
source=('http://search.mcpan.org/CPAN/authors/id/J/JB/JBURNETT/Text-WikiCreole-0.07.tar.gz')
md5sums=('25710dadbf919f519bd389490470dd88')
sha512sums=('838cb770c99961af212b8c01f61f3a819a2d79ef83a1443541ca0be00850dc78c7c5b407dd101110cd14c0f491a5a8224fee982621bd5ade5a875095e6ac1b7e')
_distdir="Text-WikiCreole-0.07"

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

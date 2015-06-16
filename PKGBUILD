# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-digest-shabal'
pkgver='0.04'
pkgrel='1'
pkgdesc="Perl interface to the Shabal digest algorithm"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Digest-Shabal'
source=('http://search.cpan.org/CPAN/authors/id/G/GR/GRAY/Digest-Shabal-0.04.tar.gz')
md5sums=('94a9a9086831301a3c111321b816d033')
sha512sums=('f5a5efe296f313b61e9e050592d7e0dce82df3108e361e29e0f9a7f02de155ba5a316de9a0b7cc128561d195def6ee179e96657db86d0a7a7526135b0042fff0')
_distdir="Digest-Shabal-0.04"

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

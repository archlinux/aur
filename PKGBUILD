# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-digest-adler32'
pkgver='0.03'
pkgrel='1'
pkgdesc="The Adler-32 checksum"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Digest-Adler32'
source=('http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/Digest-Adler32-0.03.tar.gz')
md5sums=('63fc73aa3f3ea5e0eaa76f14ce9ecafa')
sha512sums=('4f090b5a8205841471bc0805fd508cc8b80637ffdc817ae695dd80ce7cbe2b5441babf0378baee425ee7cb98fe19191999ff681eba5601371dfe3837fdc6f23b')
_distdir="Digest-Adler32-0.03"

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

# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-xml-rpc'
pkgver='2.1'
pkgrel='1'
pkgdesc="Pure Perl implementation for an XML-RPC client and server"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-lwp-protocol-https>=0' 'perl-xml-treepp>=0' 'perl-libwww>=0')
makedepends=()
url='https://metacpan.org/release/XML-RPC'
source=('http://search.cpan.org/CPAN/authors/id/C/CA/CAVAC/XML-RPC-2.1.tar.gz')
md5sums=('ed163a5c26c28a6f8350892ee544e713')
sha512sums=('9aefdc1b816165224c91b3018bbb7a275b3c3c9151c4804cf6ccf55e90d20d0bf763341e8704f0e0ea2ad9716c757177628539c4af126894f0175457976091e5')
_distdir="XML-RPC-2.1"

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

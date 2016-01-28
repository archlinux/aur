# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-nginx'
pkgver='0.24'
pkgrel='1'
pkgdesc="Data-driven test scaffold for Nginx C module and OpenResty Lua library development"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-http-message>=0' 'perl-list-moreutils>=0' 'perl-test-base>=0' 'perl-test-longstring>=0' 'perl-text-diff>=0' 'perl-uri>=0' 'perl-libwww>=0' 'perl>=5.6.1')
makedepends=()
url='https://metacpan.org/release/Test-Nginx'
source=('http://search.cpan.org/CPAN/authors/id/A/AG/AGENT/Test-Nginx-0.24.tar.gz')
md5sums=('86ef48e9bec0318ee89f775e60a11639')
sha512sums=('b8fc3cb47028f452e500a65c5b7ae95b37c619a8490d65466fa9618291f53d9fa743657e4b87126e72c24a5d2060295616451c2b44346c5ac314bc542036edf1')
_distdir="Test-Nginx-0.24"

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

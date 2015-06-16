# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-config-yaml'
pkgver='1.42'
pkgrel='1'
pkgdesc="Simple configuration automation"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-yaml>=0.35')
makedepends=()
url='http://search.cpan.org/dist/Config-YAML'
source=('http://search.cpan.org/CPAN/authors/id/M/MD/MDXI/Config-YAML-1.42.tar.gz')
md5sums=('cfee6763e19cb4c80bfb60f922b882dd')
sha512sums=('101f95ec020b2afeeb77c7b38f08400588482db4f5ebe25c20b360ac1dc904784bf4c79f1ac112b29dade0a2ae7e2bbbdef3eb1924381b7e7c49b8144c32e123')
_distdir="Config-YAML-1.42"

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

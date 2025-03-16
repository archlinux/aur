# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25
# Maintainer: Ido Perlmuter <ido at ido50 dot net>

pkgname='svsh'
pkgver='1.003000'
pkgrel='1'
pkgdesc="Process supervision shell for daemontools/perp/s6/runit"
arch=('any')
license=('Apache-2.0')
options=('!emptydirs')
depends=('perl' 'perl-moo' 'perl-proc-processtable' 'perl-term-readline-gnu' 'perl-term-shellui' 'perl-namespace-clean')
makedepends=()
url='https://metacpan.org/dist/Svsh'
source=("https://cpan.metacpan.org/authors/id/I/ID/IDOPEREL/Svsh-$pkgver.tar.gz")
sha256sums=('f7670017118b02ce18a43ea6a5c5c411c15fb68dfd683c0f854fa4631525a097')
_distdir="Svsh-$pkgver"

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

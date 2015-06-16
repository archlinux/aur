# Contributor: John D Jones III <jnbek1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-file-keepass-agent'
pkgver='2.01'
pkgrel='1'
pkgdesc="Application agent for working with File::KeePass objects"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-config-tiny>=0.01' 'perl-file-keepass>=0.01' 'perl-io-prompt>=0.01' 'perl-x11-guitest>=0.01' 'perl-x11-protocol>=0.01')
makedepends=()
url='http://search.mcpan.org/dist/File-KeePass-Agent'
source=('http://search.cpan.org/CPAN/authors/id/R/RH/RHANDOM/File-KeePass-Agent-2.01.tar.gz')
md5sums=('53c38134d7f202226f4f4a0c9ad78b60')
sha512sums=('00014e4ce8454c9c8f1cdf1d7b0367c56c01840a581503ebf1c131d7e98703e6d3b35848ad62e0c62d50c85960684422856dc69e7f55f17e12f5889e8e487aa2')
_distdir="File-KeePass-Agent-2.01"

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

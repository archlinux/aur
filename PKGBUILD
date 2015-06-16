# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-net-prober'
pkgver='0.11'
pkgrel='1'
pkgdesc="Probes network hosts for downtime, latency, etc..."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-io-socket-ssl>=0' 'perl-lwp-online>=0' 'perl-lwpx-paranoidagent>=0')
makedepends=()
url='http://search.cpan.org/dist/Net-Prober'
source=('http://search.cpan.org/CPAN/authors/id/C/CO/COSIMO/Net-Prober-0.11.tar.gz')
md5sums=('4a63f563c2a3ce61b8dff1a69806e50d')
sha512sums=('c3820d24437b6de0b8b29ac0409fc938df44f56c1701e64bef0b142661cc49db0b42a43705b98823ecc1e1c30189ec54b1bc5c3b873c777b5b4bd164266833c3')
_distdir="Net-Prober-0.11"

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

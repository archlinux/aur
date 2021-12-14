# Contributor: Ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-sentry-raven'
pkgver='1.14'
pkgrel='1'
pkgdesc="A perl sentry client"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-data-dump>=0' 'perl-devel-stacktrace>=0' 'perl-file-slurp>=0' 'perl-http-message>=0' 'perl-json-xs>=0' 'perl-lwp-protocol-https>=0' 'perl-moo>=0' 'perl-moox-types-mooselike>=0' 'perl-uri>=0' 'perl-uuid-tiny>=0' 'perl-libwww>=0' 'perl>=5.008')
makedepends=()
checkdepends=('perl-test-cpan-changes-reallystrict>=0' 'perl-test-lwp-useragent>=0' 'perl-test-perl-critic>=1.03' 'perl-test-warn>=0.30')
url='https://metacpan.org/dist/Sentry-Raven'
source=("https://cpan.metacpan.org/authors/id/Q/QR/QRRY/Sentry-Raven-$pkgver.tar.gz")
md5sums=('51bed1fc7318cebbca67a8ac2f20da83')
sha512sums=('7cf590b660566223051936d420388a2d796c5eccd964dc5482c19a895433245d249dc30fb7d3fa64052d6f4b49b283d7adc4e82d0dde7cfdaced9bb1de48c5b7')
_distdir="Sentry-Raven-$pkgver"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:

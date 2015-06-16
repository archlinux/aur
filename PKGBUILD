# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-mock-quick'
pkgver='1.106'
pkgrel='1'
pkgdesc="Quickly mock objects and classes, even temporarily replace them,"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-exporter-declare>=0.103' 'perl-fennec-lite>=0.004')
makedepends=('perl-test-exception>=0.29')
url='http://search.cpan.org/dist/Mock-Quick'
source=('http://search.cpan.org/CPAN/authors/id/E/EX/EXODIST/Mock-Quick-1.106.tar.gz')
md5sums=('d220c092393d2bd3ac3b2a7781cfe9c0')
sha512sums=('94f29dd6ec99da4c44ed206b90bc8c38c9dd805fa98f6e26f74cf9aab9cab6dc6d68400ef7ef756139fcc3c7b7c8b8c0a45350a37a3fbc4940a842e16d88d01f')
_distdir="Mock-Quick-1.106"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:

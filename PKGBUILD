# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-backpan-index'
pkgver='0.42'
pkgrel='1'
pkgdesc="An interface to the BackPAN index"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-app-cache>=0.37' 'perl-archive-extract' 'perl-class>=1.00' 'perl-cpan-distnameinfo>=0.09' 'perl-dbd-sqlite>=1.25' 'perl-dbix-class>=0.08109' 'perl-mouse>=0.64' 'perl-path-class>=0.17' 'perl-uri>=1.54' 'perl-libwww' 'perl>=5.8.1')
makedepends=()
checkdepends=('perl-test-compile>=0.11')
url='https://metacpan.org/release/BackPAN-Index'
source=('http://search.cpan.org/CPAN/authors/id/M/MS/MSCHWERN/BackPAN-Index-0.42.tar.gz')
md5sums=('14404bf91f6a0a65782701d2ee0ea1bb')
sha512sums=('57b4bc03429750b5fdd53df476dd3f8853605bd18b07b7e9f8a8047c4f09344548e39f783988a5474261ca951f47b4a715e288318d2bd808d30154c8b1fac3ac')
_distdir="BackPAN-Index-0.42"

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

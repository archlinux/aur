# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-gravatar-url'
pkgver='1.07'
pkgrel='1'
pkgdesc="Perl/CPAN Module Gravatar::URL: Make URLs for Gravatars from an email address"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-net-dns>=1.01' 'perl-uri' 'perl>=5.6.0')
makedepends=()
checkdepends=('perl-test-mockrandom>=1.01' 'perl-test-warn>=0.11')
url='https://metacpan.org/release/Gravatar-URL'
source=("http://search.cpan.org/CPAN/authors/id/M/MS/MSCHWERN/Gravatar-URL-$pkgver.tar.gz")
md5sums=('379af6d5281e1a6d9d33db539060a126')
sha512sums=('2c72841e62f48f6a1684845ec8a3c1d7306ef98b6f8191ccbae28fc07d2238989acc52c3238828c9458fd9154e102596e20a6ec33bd8f77eaa4934fd65750bd5')
_distdir="Gravatar-URL-$pkgver"

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

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:

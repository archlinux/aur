# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-authen-captcha'
pkgver='1.024'
pkgrel='1'
pkgdesc="Perl extension for creating captcha's to verify the human element in transactions."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-gd>=0' 'perl-string-random>=0')
makedepends=()
url='https://metacpan.org/release/Authen-Captcha'
source=('https://cpan.metacpan.org/authors/id/L/LK/LKUNDRAK/Authen-Captcha-1.024.tar.gz')
md5sums=('266464497d74ff6c284fc2a7a6245576')
sha512sums=('eebe7796d089cdb4f8c78f91b42ac37492a98e5cc1c8e04266595bb391000d57e77fe0030d0d1ce74791d51dc51303615d49f20b302471e7d570afa777a581e0')
_distdir="Authen-Captcha-1.024"

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

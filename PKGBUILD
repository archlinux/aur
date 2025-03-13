# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-www-form-urlencoded'
pkgver='0.26'
pkgrel='2'
pkgdesc="parser and builder for application/x-www-form-urlencoded"
arch=('any')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl>=5.8.1')
makedepends=('perl-module-build')
url='https://metacpan.org/release/WWW-Form-UrlEncoded'
source=('http://search.cpan.org/CPAN/authors/id/K/KA/KAZEBURO/WWW-Form-UrlEncoded-0.26.tar.gz')
md5sums=('cbe0e1c3ee54738d900c739ea348efda')
sha512sums=('7980b42f53a7801fe02db30b87552ce4d5e7398413640a94d9abad2779085ebfc6208804ed66099161d8c3ba5e47ecb4bf8e8fa1f36f2e7297b864a25f3ac924')
_distdir="WWW-Form-UrlEncoded-0.26"

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
